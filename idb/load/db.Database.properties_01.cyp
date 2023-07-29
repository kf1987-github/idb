
LOAD CSV WITH HEADERS FROM 'file:///db.Database.properties_01.csv' AS line
FIELDTERMINATOR '|'
MATCH (s:Database {db_name: line.DB_NAME})
SET s.db_name=line.DB_NAME, s.patch_date=line.PATCH_DATE, s.db_owner=line.DB_OWNER ;

