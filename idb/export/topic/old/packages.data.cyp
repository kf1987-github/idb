query = """match (p:Package)
   RETURN {package: p.package, package_name: p.package_name};"""
