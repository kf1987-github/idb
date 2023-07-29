
LOAD CSV WITH HEADERS FROM 'file:///db.Table.nodes_01.csv' AS line
FIELDTERMINATOR '|'
MERGE (s:Table {pk_table: line.PK_TABLE})
ON CREATE SET s.pk_table=line.PK_TABLE, s.db_name=line.DB_NAME, s.table_name=line.TABLE_NAME, s.options=line.OPTIONS
ON MATCH SET s.pk_table=line.PK_TABLE, s.db_name=line.DB_NAME, s.table_name=line.TABLE_NAME, s.options=line.OPTIONS ;

