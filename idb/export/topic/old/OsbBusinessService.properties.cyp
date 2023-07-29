query = """MATCH (n:OsbBusinessService)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
