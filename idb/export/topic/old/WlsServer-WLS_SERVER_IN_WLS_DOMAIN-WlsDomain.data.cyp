query = """MATCH (a:WlsServer)-[r:WLS_SERVER_IN_WLS_DOMAIN]->(b:WlsDomain)
   RETURN r {source_wls_server_name: a.wls_server_name, destination_wls_domain_name: b.wls_domain_name, .*};"""
