query = """MATCH (n:NsCsPolicy)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
