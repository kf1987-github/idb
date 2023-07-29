query = """match (ds:WlsDatasource)-->(c:DatabaseConnectstring)
match (ds)-->(w:WlsDomain)
optional match (c)-->(s:DatabaseService)
optional match (s)-->(d:Database)
return {wls_domain_name: w.wls_domain_name, wls_datasource: ds.wls_datasource, ldapentry_name: c.ldapentry_name,
service_name: s.service_name, database: d.database} as out
union
match (ds:WlsDatasource)-->(s:DatabaseService)
match (ds)-->(w:WlsDomain)
optional match (s)-->(d:Database)
return {wls_domain_name: w.wls_domain_name, wls_datasource: ds.wls_datasource,
service_name: s.service_name, database: d.database} as out
union
match (ds:WlsDatasource)
where not exists((ds)-->(:DatabaseConnectstring)) and not exists((ds)-->(:DatabaseService))
match (ds)-->(w:WlsDomain)
return {wls_domain_name: w.wls_domain_name, wls_datasource: ds.wls_datasource} as out;"""
