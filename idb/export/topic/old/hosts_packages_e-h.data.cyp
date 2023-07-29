query = """match (p:Package)-[r]->(n:Host)
   WHERE p.package =~ '[e-hE-H].*'
   RETURN {host: n.host, package_name: p.package_name, package: p.package};"""
