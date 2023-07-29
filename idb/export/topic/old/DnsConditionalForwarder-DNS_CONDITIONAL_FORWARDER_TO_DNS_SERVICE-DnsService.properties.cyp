query = """MATCH (:DnsConditionalForwarder)-[r:DNS_CONDITIONAL_FORWARDER_TO_DNS_SERVICE]->(:DnsService)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
