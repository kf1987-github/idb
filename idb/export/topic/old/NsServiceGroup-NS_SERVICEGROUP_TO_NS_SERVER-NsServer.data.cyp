query = """MATCH (a:NsServiceGroup)-[r:NS_SERVICEGROUP_TO_NS_SERVER]->(b:NsServer)
   RETURN r {source_ns_servicegroup_name: a.ns_servicegroup_name, destination_ns_server_name: b.ns_server_name, .*};"""
