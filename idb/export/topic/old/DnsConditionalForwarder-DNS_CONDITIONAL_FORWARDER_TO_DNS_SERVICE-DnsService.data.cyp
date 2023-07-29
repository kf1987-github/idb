query = """MATCH (a:DnsConditionalForwarder)-[r:DNS_CONDITIONAL_FORWARDER_TO_DNS_SERVICE]->(b:DnsService)
   RETURN r {source_dns_conditional_forwarder_name: a.dns_conditional_forwarder_name, destination_dns_service_name: b.dns_service_name, .*};"""
