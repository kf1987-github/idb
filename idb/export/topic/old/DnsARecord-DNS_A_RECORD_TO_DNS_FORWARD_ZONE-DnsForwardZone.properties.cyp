query = """MATCH (:DnsARecord)-[r:DNS_A_RECORD_TO_DNS_FORWARD_ZONE]->(:DnsForwardZone)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
