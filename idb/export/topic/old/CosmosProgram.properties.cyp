query = """MATCH (n:CosmosProgram)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
