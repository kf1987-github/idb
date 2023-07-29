query = """MATCH (n:MsSqlServer)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
