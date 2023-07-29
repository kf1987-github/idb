query = """MATCH (a:DnsPtrRecord)-[r:DNS_PTR_RECORD_TO_DNS_REVERSE_ZONE]->(b:DnsReverseZone)
   RETURN r {source_dns_ptr_record_name: a.dns_ptr_record_name, destination_dns_reverse_zone_name: b.dns_reverse_zone_name, .*};"""
