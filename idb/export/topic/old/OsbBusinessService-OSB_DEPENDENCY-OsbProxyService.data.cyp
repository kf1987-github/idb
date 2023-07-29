query = """MATCH (a:OsbBusinessService)-[r:OSB_DEPENDENCY]->(b:OsbProxyService)
   RETURN r {source_osb_businessservice_name: a.osb_businessservice_name, destination_osb_proxyservice_name: b.osb_proxyservice_name, .*};"""
