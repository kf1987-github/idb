query = """MATCH (a:NsCsPolicy)-[r:NS_CS_POLICY_TO_NS_CS_ACTION]->(b:NsCsAction)
   RETURN r {source_ns_cs_policy_name: a.ns_cs_policy_name, destination_ns_cs_action_name: b.ns_cs_action_name, .*};"""
