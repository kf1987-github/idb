query = """match (p:Package)-[r]->(n:Host)
   WHERE p.package =~ '[m-pM-P].*'
   RETURN {host: n.host, package_name: p.package_name, package: p.package};"""
