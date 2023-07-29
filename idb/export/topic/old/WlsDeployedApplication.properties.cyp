query = """MATCH (n:WlsDeployedApplication)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
