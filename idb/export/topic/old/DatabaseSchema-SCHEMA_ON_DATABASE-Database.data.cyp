query = """MATCH (a:DatabaseSchema)-[r:SCHEMA_ON_DATABASE]->(b:Database)
   RETURN r {source_schema_name: a.schema_name, destination_database: b.database, .*};"""
