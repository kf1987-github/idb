query = """MATCH (n:WlsCluster)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
