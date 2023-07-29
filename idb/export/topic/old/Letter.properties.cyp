query = """MATCH (n:Letter)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
