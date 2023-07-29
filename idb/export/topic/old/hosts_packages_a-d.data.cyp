query = """match (p:Package)-[r]->(n:Host)
   WHERE p.package =~ '[a-dA-D].*'
   RETURN {host: n.host, package_name: p.package_name, package: p.package};"""
