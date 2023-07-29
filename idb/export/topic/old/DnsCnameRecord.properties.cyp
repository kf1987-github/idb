query = """MATCH (n:DnsCnameRecord)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
