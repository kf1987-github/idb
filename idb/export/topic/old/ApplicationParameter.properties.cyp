query = """MATCH (n:ApplicationParameter)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
