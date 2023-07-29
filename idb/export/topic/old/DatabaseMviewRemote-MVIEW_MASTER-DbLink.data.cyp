query = """MATCH (a:DatabaseMviewRemote)-[r:MVIEW_MASTER]->(b:DbLink)
   RETURN r {source_database_mview_name: a.database_mview_name, destination_db_link_name: b.db_link_name, .*};"""
