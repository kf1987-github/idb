query = """MATCH (d:Database)-[r]->(n:Host)
   RETURN {host: n.host, database: d.database, instance_name: r.instance_name};"""
