query = """MATCH (n:KszFlux)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
