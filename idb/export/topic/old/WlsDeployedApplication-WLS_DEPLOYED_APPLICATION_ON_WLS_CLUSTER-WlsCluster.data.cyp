query = """MATCH (a:WlsDeployedApplication)-[r:WLS_DEPLOYED_APPLICATION_ON_WLS_CLUSTER]->(b:WlsCluster)
   RETURN r {source_wls_deployed_application_name: a.wls_deployed_application_name, destination_wls_cluster_name: b.wls_cluster_name, .*};"""
