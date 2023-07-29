
MATCH (d:Database)
MATCH (n:Host)
WHERE d.host = n.host_name
MERGE (d)-[r:DATABASE_ON_HOST {hosted_on: n.host_name}]->(n);

