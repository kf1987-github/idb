query = """MATCH (n:NexusArtifact)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
