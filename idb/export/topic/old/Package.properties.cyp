query = """MATCH (n:Package)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
