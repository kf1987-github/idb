query = """MATCH (:WlsDatasource)-[r:WLS_DATASOURCE_TO_WLS_CLUSTER]->(:WlsCluster)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
