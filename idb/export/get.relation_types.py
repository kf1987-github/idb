#!/usr/bin/python

import urllib.request
import json
import os

neo_user = os.environ.get("NEO_USER")
neo_pwd = os.environ.get("NEO_PWD")
neo_host = os.environ.get("NEO_HOST")
neo_port = os.environ.get("NEO_PORT")
neo_db = os.environ.get("NEO_DB")

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

query = "CALL db.relationshipTypes()"

response = neo4j_post(url,query)
#print(response)

json_data = json.loads(response)

records = json_data.get("results")[0].get("data")

out = []
for r in records:
  out.append(r.get("row")[0])
#print (json.dumps(out))

for rel in out:
  #print(rel)
  query = "match (a)-[r:" + rel + "]->(b) return distinct labels(a)[0], type(r), labels(b)[0]"
  response = neo4j_post(url,query)
  json_data = json.loads(response)
  #print (json.dumps(json_data))
  
  records = json_data.get("results")[0].get("data")
  
  #out = []
  for r in records:
    #out.append(r.get("row"))
    print (json.dumps(r.get("row")))
  #print (json.dumps(out))

