query = """MATCH (n:DnsPtrRecord)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
