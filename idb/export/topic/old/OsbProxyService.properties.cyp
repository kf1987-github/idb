query = """MATCH (n:OsbProxyService)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
