query = """MATCH (n:File)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
