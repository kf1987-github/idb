query = """MATCH (:WlsDeployedApplication)-[r:WLS_DEPLOYED_APPLICATION_TO_NEXUS_ARTIFACT]->(:NexusArtifact)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
