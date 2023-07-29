query = """MATCH (a:NsServer)-[r:NS_SERVER_TO_HOST]->(b:Host)
   RETURN r {source_ns_server_name: a.ns_server_name, destination_host: b.host, .*};"""
