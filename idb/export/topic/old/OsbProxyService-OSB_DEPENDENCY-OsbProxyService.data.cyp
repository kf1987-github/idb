query = """MATCH (a:OsbProxyService)-[r:OSB_DEPENDENCY]->(b:OsbProxyService)
   RETURN r {source_osb_proxyservice_name: a.osb_proxyservice_name, destination_osb_proxyservice_name: b.osb_proxyservice_name, .*};"""
