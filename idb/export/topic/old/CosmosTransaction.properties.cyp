query = """MATCH (n:CosmosTransaction)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
