query = """MATCH (a:DnsForwardZone)-[r:DNS_FORWARD_ZONE_TO_DNS_SERVICE]->(b:DnsService)
   RETURN r {source_dns_forward_zone_name: a.dns_forward_zone_name, destination_dns_service_name: b.dns_service_name, .*};"""
