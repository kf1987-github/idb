query = """MATCH (a:WlsDatasource)-[r:WLS_DATASOURCE_TO_WLS_CLUSTER]->(b:WlsCluster)
   RETURN r {source_wls_datasource_name: a.wls_datasource_name, destination_wls_cluster_name: b.wls_cluster_name, .*};"""
