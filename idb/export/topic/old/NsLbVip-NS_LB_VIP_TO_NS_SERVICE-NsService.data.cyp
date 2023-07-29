query = """MATCH (a:NsLbVip)-[r:NS_LB_VIP_TO_NS_SERVICE]->(b:NsService)
   RETURN r {source_ns_lb_vip_name: a.ns_lb_vip_name, destination_ns_service_name: b.ns_service_name, .*};"""
