query = """MATCH (n:NsCsAction)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
