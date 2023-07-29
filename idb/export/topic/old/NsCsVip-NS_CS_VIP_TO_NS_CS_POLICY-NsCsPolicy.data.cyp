query = """MATCH (a:NsCsVip)-[r:NS_CS_VIP_TO_NS_CS_POLICY]->(b:NsCsPolicy)
   RETURN r {source_ns_cs_vip_name: a.ns_cs_vip_name, destination_ns_cs_policy_name: b.ns_cs_policy_name, .*};"""
