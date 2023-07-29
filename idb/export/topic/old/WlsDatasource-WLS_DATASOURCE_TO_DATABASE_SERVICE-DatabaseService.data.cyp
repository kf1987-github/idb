query = """MATCH (a:WlsDatasource)-[r:WLS_DATASOURCE_TO_DATABASE_SERVICE]->(b:DatabaseService)
   RETURN r {source_wls_datasource_name: a.wls_datasource_name, destination_database_service: b.database_service, .*};"""
