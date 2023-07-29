query = """MATCH (n:NsLbVip)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
