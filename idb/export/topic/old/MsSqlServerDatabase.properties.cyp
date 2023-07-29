query = """MATCH (n:MsSqlServerDatabase)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
