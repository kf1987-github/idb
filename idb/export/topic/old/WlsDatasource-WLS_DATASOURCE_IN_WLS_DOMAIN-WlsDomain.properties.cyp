query = """MATCH (:WlsDatasource)-[r:WLS_DATASOURCE_IN_WLS_DOMAIN]->(:WlsDomain)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
