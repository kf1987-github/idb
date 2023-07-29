query = """MATCH (n:DatabaseService)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
