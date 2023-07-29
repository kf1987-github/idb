query = """MATCH (:WlsDeployedApplication)-[r:WLS_DEPLOYED_APPLICATION_ON_WLS_SERVER]->(:WlsServer)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
