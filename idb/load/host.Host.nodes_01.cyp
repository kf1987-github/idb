
LOAD CSV WITH HEADERS FROM 'file:///host.Host.nodes_01.csv' AS line
FIELDTERMINATOR '|'
MERGE (s:Host {host_name: line.HOST_NAME})
ON CREATE SET s.host_name=line.HOST_NAME, s.domain=line.DOMAIN, s.dc=line.DC
ON MATCH SET s.host_name=line.HOST_NAME, s.domain=line.DOMAIN, s.dc=line.DC ;

