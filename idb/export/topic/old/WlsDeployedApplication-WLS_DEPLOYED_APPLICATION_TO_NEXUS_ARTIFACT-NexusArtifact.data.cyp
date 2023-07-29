query = """MATCH (a:WlsDeployedApplication)-[r:WLS_DEPLOYED_APPLICATION_TO_NEXUS_ARTIFACT]->(b:NexusArtifact)
   RETURN r {source_wls_deployed_application_name: a.wls_deployed_application_name, destination_nexus_path: b.nexus_path, .*};"""
