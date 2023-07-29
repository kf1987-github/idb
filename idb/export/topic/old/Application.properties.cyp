query = """MATCH (n:Application)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
