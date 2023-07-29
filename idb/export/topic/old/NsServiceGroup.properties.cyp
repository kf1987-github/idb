query = """MATCH (n:NsServiceGroup)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
