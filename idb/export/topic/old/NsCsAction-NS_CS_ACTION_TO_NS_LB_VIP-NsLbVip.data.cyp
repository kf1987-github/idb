query = """MATCH (a:NsCsAction)-[r:NS_CS_ACTION_TO_NS_LB_VIP]->(b:NsLbVip)
   RETURN r {source_ns_cs_action_name: a.ns_cs_action_name, destination_ns_lb_vip_name: b.ns_lb_vip_name, .*};"""
