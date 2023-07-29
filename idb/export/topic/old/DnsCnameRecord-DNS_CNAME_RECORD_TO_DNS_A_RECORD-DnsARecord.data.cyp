query = """MATCH (a:DnsCnameRecord)-[r:DNS_CNAME_RECORD_TO_DNS_A_RECORD]->(b:DnsARecord)
   RETURN r {source_dns_cname_record_name: a.dns_cname_record_name, destination_dns_a_record_name: b.dns_a_record_name, .*};"""
