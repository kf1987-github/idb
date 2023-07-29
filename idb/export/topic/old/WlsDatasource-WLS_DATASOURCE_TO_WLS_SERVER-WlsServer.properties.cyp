query = """MATCH (:WlsDatasource)-[r:WLS_DATASOURCE_TO_WLS_SERVER]->(:WlsServer)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
