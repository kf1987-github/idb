query = """MATCH (a:Application)-[r:APPLICATION_TO_DATABASESCHEMA]->(b:DatabaseSchema)
   RETURN r {source_application_name: a.application_name, destination_schema_name: b.schema_name, .*};"""
