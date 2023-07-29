query = """MATCH (a:Host)-[r:HOST_IN_WLS_DOMAIN]->(b:WlsDomain)
   RETURN r {source_host: a.host, destination_wls_domain_name: b.wls_domain_name, .*};"""
