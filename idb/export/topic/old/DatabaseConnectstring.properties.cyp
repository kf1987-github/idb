query = """MATCH (n:DatabaseConnectstring)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
