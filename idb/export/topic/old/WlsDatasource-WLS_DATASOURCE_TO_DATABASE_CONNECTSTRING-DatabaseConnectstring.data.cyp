query = """MATCH (a:WlsDatasource)-[r:WLS_DATASOURCE_TO_DATABASE_CONNECTSTRING]->(b:DatabaseConnectstring)
   RETURN r {source_wls_datasource_name: a.wls_datasource_name, destination_ldapentry_name: b.ldapentry_name, .*};"""
