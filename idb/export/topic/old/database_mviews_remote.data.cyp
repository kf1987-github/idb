query = """match (m:DatabaseMviewRemote)-->(d:Database)
optional match (m)-->(l:DbLink)
optional match (l)-->(s:DatabaseService)
optional match (s)-->(e:Database)
return {database: d.database, owner: m.owner, mview_name: m.mview_name,
db_link: l.db_link, destination_service_name: s.service_name, destination_database: e.database};"""
