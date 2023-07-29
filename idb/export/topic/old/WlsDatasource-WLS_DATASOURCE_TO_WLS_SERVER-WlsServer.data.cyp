query = """MATCH (a:WlsDatasource)-[r:WLS_DATASOURCE_TO_WLS_SERVER]->(b:WlsServer)
   RETURN r {source_wls_datasource_name: a.wls_datasource_name, destination_wls_server_name: b.wls_server_name, .*};"""
