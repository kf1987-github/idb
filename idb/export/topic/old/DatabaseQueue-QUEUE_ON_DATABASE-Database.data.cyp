query = """MATCH (a:DatabaseQueue)-[r:QUEUE_ON_DATABASE]->(b:Database)
   RETURN r {source_database_queue_name: a.database_queue_name, destination_database: b.database, .*};"""
