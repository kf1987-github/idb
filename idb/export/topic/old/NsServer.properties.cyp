query = """MATCH (n:NsServer)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
