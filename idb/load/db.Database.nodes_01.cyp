
LOAD CSV WITH HEADERS FROM 'file:///db.Database.nodes_01.csv' AS line
FIELDTERMINATOR '|'
MERGE (s:Database {db_name: line.DB_NAME})
ON CREATE SET s.db_name=line.DB_NAME, s.db_version=line.DB_VERSION, s.app=line.APP, s.env=line.ENV, s.ha=line.HA, s.host=line.HOST
ON MATCH SET s.db_name=line.DB_NAME, s.db_version=line.DB_VERSION, s.app=line.APP, s.env=line.ENV, s.ha=line.HA, s.host=line.HOST ;

