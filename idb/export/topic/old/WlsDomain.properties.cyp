query = """MATCH (n:WlsDomain)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
