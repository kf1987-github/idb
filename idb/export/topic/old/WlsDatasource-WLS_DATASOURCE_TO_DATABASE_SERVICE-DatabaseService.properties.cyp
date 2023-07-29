query = """MATCH (:WlsDatasource)-[r:WLS_DATASOURCE_TO_DATABASE_SERVICE]->(:DatabaseService)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
