query = """MATCH (n:DbLink)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
