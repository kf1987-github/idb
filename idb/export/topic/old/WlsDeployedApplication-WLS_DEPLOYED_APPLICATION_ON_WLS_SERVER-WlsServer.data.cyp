query = """MATCH (a:WlsDeployedApplication)-[r:WLS_DEPLOYED_APPLICATION_ON_WLS_SERVER]->(b:WlsServer)
   RETURN r {source_wls_deployed_application_name: a.wls_deployed_application_name, destination_wls_server_name: b.wls_server_name, .*};"""
