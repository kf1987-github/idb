query = """MATCH (a:MsSqlServerDatabase)-[r:MS_SQL_SERVER_DATABASE_ON_MS_SQL_SERVER]->(b:MsSqlServer)
   RETURN r {source_ms_sql_server_database_name: a.ms_sql_server_database_name, destination_ms_sql_server_name: b.ms_sql_server_name, .*};"""
