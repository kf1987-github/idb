query = """MATCH (a:WlsServer)-[r:WLS_SERVER_IN_WLS_CLUSTER]->(b:WlsCluster)
   RETURN r {source_wls_server_name: a.wls_server_name, destination_wls_cluster_name: b.wls_cluster_name, .*};"""
