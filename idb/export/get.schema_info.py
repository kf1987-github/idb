#!/usr/bin/python

import urllib.request
import json
import os
import shutil
import stat

neo_user = os.environ.get("NEO_USER")
neo_pwd = os.environ.get("NEO_PWD")
neo_host = os.environ.get("NEO_HOST")
neo_port = os.environ.get("NEO_PORT")
neo_db = os.environ.get("NEO_DB")
web_dir = os.environ.get("WEB_DIR")

topics = []

def neo4j_login(url,username,password):
   password_mgr = urllib.request.HTTPPasswordMgrWithDefaultRealm()
   password_mgr.add_password(None, url, neo_user, neo_pwd)
   handler = urllib.request.HTTPBasicAuthHandler(password_mgr)
   opener = urllib.request.build_opener(handler)
   opener.open(url)
   urllib.request.install_opener(opener)
   response = urllib.request.urlopen(url)
   answer = response.read()
   return answer

def neo4j_post(url,query):
   post_msg = '{"statements": [ {"statement": "' + query + '"} ]}'
   data = post_msg.encode('utf-8')
   req = urllib.request.Request(url,data)
   req.add_header('Content-Type', 'application/json')
   req.add_header('Accept', 'application/json;charset=UTF-8')
   response = urllib.request.urlopen(req)
   answer = response.read()
   return answer

url = "http://" + neo_host + ":" + neo_port
#print(url)

response = neo4j_login(url,neo_user,neo_pwd)
#print(response)

url = "http://" + neo_host + ":" + neo_port + "/db/" + neo_db + "/tx"
#print(url)


### labels

query = "CALL db.labels()"

response = neo4j_post(url,query)
json_data = json.loads(response)
records = json_data.get("results")[0].get("data")

for r in records:
  print (r.get("row")[0])
  topics.append({"topic_type": "nodes", "topic": r.get("row")[0]})


### primary key per label

query = "SHOW constraints"

response = neo4j_post(url,query)
json_data = json.loads(response)
records = json_data.get("results")[0].get("data")

for r in records:
  print (r.get("row")[4][0] + "|" + r.get("row")[5][0])
  for t in topics:
    if t["topic"] == r.get("row")[4][0]:
      t["pk"] = r.get("row")[5][0]


### keys per label

query = """CALL db.schema.nodeTypeProperties() YIELD nodeLabels, propertyName \
           RETURN distinct nodeLabels[0] as label, collect(propertyName) as keys"""

response = neo4j_post(url,query)
json_data = json.loads(response)
records = json_data.get("results")[0].get("data")

for r in records:
  print (r.get("row")[0] + "|" + ",".join(r.get("row")[1]))
  for t in topics:
    if t["topic_type"] == "nodes" and t["topic"] == r.get("row")[0]:
      t["keys"] = r.get("row")[1]


### relationships

query = "CALL db.relationshipTypes()"

response = neo4j_post(url,query)
json_data = json.loads(response)
records = json_data.get("results")[0].get("data")

rels = []
for r in records:
  rels.append(r.get("row")[0])

for rel in rels:
  query = "match (a)-[r:" + rel + "]->(b) return distinct labels(a)[0], type(r), labels(b)[0]"
  response = neo4j_post(url,query)
  json_data = json.loads(response)
  records = json_data.get("results")[0].get("data")
  
  for r in records:
    print ("-".join(r.get("row")))
    topics.append({"topic_type":"relations", "topic": "-".join(r.get("row")), "source_label": r.get("row")[0], "dest_label": r.get("row")[2], "relationship": r.get("row")[1]})


### keys per relationship

query = """CALL db.schema.relTypeProperties() YIELD relType, propertyName \
           RETURN distinct replace(replace(relType,':',''),'`','') as relation, collect(propertyName) as keys"""

response = neo4j_post(url,query)
json_data = json.loads(response)
records = json_data.get("results")[0].get("data")

for r in records:
  print (r.get("row")[0] + "|" + ",".join(r.get("row")[1]))
  for t in topics:
    if t["topic_type"] == "relations" and t["relationship"] == r.get("row")[0]:
      t["keys"] = r.get("row")[1]


print (topics)


### write topics to javascript file

# first change from array to dict/json
out = {"nodes": [], "relations": [], "reports": []}
for t in topics:
  if t["topic_type"] == "nodes":
    t.pop("topic_type")
    out.get("nodes").append(t)
  elif t["topic_type"] == "relations":
    t.pop("topic_type")
    out.get("relations").append(t)
  else:
    print("Error processing topic: " + t)

# add viewer query and browser query, for each topic
for n in out.get("nodes"):
  n.update( {"viewer": {"query": "MATCH (a:" + n.get("topic") + ") RETURN a", "signature": {"node_aliasses": ["a"], "relation_aliasses": [] }}} )
  cols = ""
  for c in n.get("keys"):
    cols = cols + "a." + c + ", "
  browser_query = "MATCH (a:" + n.get("topic") + ") RETURN " + cols.rstrip(", ")
  n.update( {"browser": {"query": browser_query}} )

for r in out.get("relations"):
  r.update( {"viewer": {"query": "MATCH (a:" + r.get("source_label") + ")-[r:" + r.get("relationship") + "]->(b:" + r.get("dest_label") + ") RETURN a, r, b", "signature": {"node_aliasses": ["a","b"], "relation_aliasses": ["r"] }}} )
  # find source pk
  for n in out.get("nodes"):
    if n["topic"] == r.get("source_label"):
      source_pk = n.get("pk")
  # find dest pk
  for n in out.get("nodes"):
    if n["topic"] == r.get("dest_label"):
      dest_pk = n.get("pk")
  cols = ", "
  for c in r.get("keys"):
    cols = cols + "r." + c + ", "
  browser_query = "MATCH (a:" + r.get("source_label") + ")-[r:" + r.get("relationship") + "]->(b:" + r.get("dest_label") + ") RETURN a." + source_pk + " as source_" + source_pk + "" + cols.rstrip(", ") + ", b." + dest_pk + " as dest_" + dest_pk
  r.update( {"browser": {"query": browser_query}} )

print(out)

f_path = web_dir + "/topics.json"
f = open(f_path, "a")
f.write(json.dumps(out) + "\n")
f.close()
shutil.chown(f_path, "neo4j", "neo4j")
os.chmod(f_path, stat.S_IROTH)
