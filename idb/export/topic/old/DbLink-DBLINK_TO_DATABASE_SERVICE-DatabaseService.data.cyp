query = """MATCH (a:DbLink)-[r:DBLINK_TO_DATABASE_SERVICE]->(b:DatabaseService)
   RETURN r {source_db_link_name: a.db_link_name, destination_database_service: b.database_service, .*};"""
