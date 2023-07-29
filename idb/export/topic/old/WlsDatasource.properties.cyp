query = """MATCH (n:WlsDatasource)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
