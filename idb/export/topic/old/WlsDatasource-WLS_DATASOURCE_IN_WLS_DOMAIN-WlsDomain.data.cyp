query = """MATCH (a:WlsDatasource)-[r:WLS_DATASOURCE_IN_WLS_DOMAIN]->(b:WlsDomain)
   RETURN r {source_wls_datasource_name: a.wls_datasource_name, destination_wls_domain_name: b.wls_domain_name, .*};"""
