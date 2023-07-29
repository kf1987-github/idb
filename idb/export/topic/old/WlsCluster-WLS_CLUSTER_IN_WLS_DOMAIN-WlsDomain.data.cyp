query = """MATCH (a:WlsCluster)-[r:WLS_CLUSTER_IN_WLS_DOMAIN]->(b:WlsDomain)
   RETURN r {source_wls_cluster_name: a.wls_cluster_name, destination_wls_domain_name: b.wls_domain_name, .*};"""
