query = """MATCH (a:DnsARecord)-[r:DNS_A_RECORD_TO_DNS_FORWARD_ZONE]->(b:DnsForwardZone)
   RETURN r {source_dns_a_record_name: a.dns_a_record_name, destination_dns_forward_zone_name: b.dns_forward_zone_name, .*};"""
