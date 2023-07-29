query = """MATCH (n:DatabaseMviewRemote)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
