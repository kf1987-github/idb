query = """match (d:Database)-->(l:DbLink)
optional match (l)-->(s:DatabaseService)
optional match (s:DatabaseService)-->(e:Database)
return {database: d.database, db_link: l.db_link, connect_string: l.connect_string,
service_name: s.service_name, destination_database: e.database};"""
