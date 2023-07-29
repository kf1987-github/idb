query = """MATCH (n:WlsServer)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
