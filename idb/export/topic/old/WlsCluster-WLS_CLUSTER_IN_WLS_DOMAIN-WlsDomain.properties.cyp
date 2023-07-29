query = """MATCH (:WlsCluster)-[r:WLS_CLUSTER_IN_WLS_DOMAIN]->(:WlsDomain)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
