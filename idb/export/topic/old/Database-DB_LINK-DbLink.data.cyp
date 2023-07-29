query = """MATCH (a:Database)-[r:DB_LINK]->(b:DbLink)
   RETURN r {source_database: a.database, destination_db_link_name: b.db_link_name, .*};"""
