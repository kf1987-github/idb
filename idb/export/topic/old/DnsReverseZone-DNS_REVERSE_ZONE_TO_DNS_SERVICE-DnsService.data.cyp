query = """MATCH (a:DnsReverseZone)-[r:DNS_REVERSE_ZONE_TO_DNS_SERVICE]->(b:DnsService)
   RETURN r {source_dns_reverse_zone_name: a.dns_reverse_zone_name, destination_dns_service_name: b.dns_service_name, .*};"""
