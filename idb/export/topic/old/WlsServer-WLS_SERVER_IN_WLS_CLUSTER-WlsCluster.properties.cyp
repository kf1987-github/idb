query = """MATCH (:WlsServer)-[r:WLS_SERVER_IN_WLS_CLUSTER]->(:WlsCluster)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
