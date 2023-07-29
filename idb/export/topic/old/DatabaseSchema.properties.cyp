query = """MATCH (n:DatabaseSchema)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
