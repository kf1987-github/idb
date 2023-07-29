query = """MATCH (:WlsDeployedApplication)-[r:WLS_DEPLOYED_APPLICATION_ON_WLS_CLUSTER]->(:WlsCluster)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
