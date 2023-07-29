query = """MATCH (n:NsService)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
