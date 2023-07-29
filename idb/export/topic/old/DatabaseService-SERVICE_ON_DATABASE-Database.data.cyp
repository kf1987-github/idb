query = """MATCH (a:DatabaseService)-[r:SERVICE_ON_DATABASE]->(b:Database)
   RETURN r {source_database_service: a.database_service, destination_database: b.database, .*};"""
