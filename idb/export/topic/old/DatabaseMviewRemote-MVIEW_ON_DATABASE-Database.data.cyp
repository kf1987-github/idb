query = """MATCH (a:DatabaseMviewRemote)-[r:MVIEW_ON_DATABASE]->(b:Database)
   RETURN r {source_database_mview_name: a.database_mview_name, destination_database: b.database, .*};"""
