query = """MATCH (n:NsCsVip)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
