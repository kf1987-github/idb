query = "MATCH (a:Database)-[r:DATABASE_ON_HOST]->(b:Host) RETURN r {source_database: a.database, destination_host: b.host, .*}"
