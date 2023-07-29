query = """MATCH (a:DatabaseQueue)-[r:QUEUE_SCHEDULE]->(b:DbLink)
   RETURN r {source_database_queue_name: a.database_queue_name, destination_db_link_name: b.db_link_name, .*};"""
