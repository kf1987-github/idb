query = """MATCH (a:NsLbVip)-[r:NS_LB_VIP_TO_NS_SERVICEGROUP]->(b:NsServiceGroup)
   RETURN r {source_ns_lb_vip_name: a.ns_lb_vip_name, destination_ns_servicegroup_name: b.ns_servicegroup_name, .*};"""
