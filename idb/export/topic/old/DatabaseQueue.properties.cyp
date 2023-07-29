query = """MATCH (n:DatabaseQueue)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
