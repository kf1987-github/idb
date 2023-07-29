
LOAD CSV WITH HEADERS FROM 'file:///db.Table-Database.relations_01.csv' AS line
FIELDTERMINATOR '|'
MATCH (s:Table)
WHERE s.pk_table=line.PK_TABLE
MATCH (d:Database)
WHERE d.db_name=line.DB_NAME
MERGE (s)-[r:TABLE_IN_DATABASE]->(d)
ON CREATE SET r.data_type=line.SOURCE_TYPE
ON MATCH SET r.data_type=line.SOURCE_TYPE ;

