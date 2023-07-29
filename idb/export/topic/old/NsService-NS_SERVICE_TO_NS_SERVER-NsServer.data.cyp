query = """MATCH (a:NsService)-[r:NS_SERVICE_TO_NS_SERVER]->(b:NsServer)
   RETURN r {source_ns_service_name: a.ns_service_name, destination_ns_server_name: b.ns_server_name, .*};"""
