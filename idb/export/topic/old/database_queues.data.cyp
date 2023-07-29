query = """match (q:DatabaseQueue)-->(d:Database)
optional match (q)-[r]->(l:DbLink)
optional match (l)-->(s:DatabaseService)
optional match (s)-->(e:Database)
return {database: d.database, owner: q.owner, queue_name: q.queue_name, queue_table: q.queue_table,
db_link: l.db_link, destination_service_name: s.service_name, destination_database: e.database,
destination_schema: r.destination_schema, destination_queue_name: r.destination_queue_name};"""

