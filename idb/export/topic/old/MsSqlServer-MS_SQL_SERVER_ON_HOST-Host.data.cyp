query = """MATCH (a:MsSqlServer)-[r:MS_SQL_SERVER_ON_HOST]->(b:Host)
   RETURN r {source_ms_sql_server_name: a.ms_sql_server_name, destination_host: b.host, .*};"""
