query = """MATCH (a:Package)-[r:PACKAGE_ON_HOST]->(b:Host)
   RETURN r {source_package_name: a.package_name, destination_host: b.host, .*};"""
