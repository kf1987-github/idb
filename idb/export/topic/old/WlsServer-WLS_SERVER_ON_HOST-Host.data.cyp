query = """MATCH (a:WlsServer)-[r:WLS_SERVER_ON_HOST]->(b:Host)
   RETURN r {source_wls_server_name: a.wls_server_name, destination_host: b.host, .*};"""
