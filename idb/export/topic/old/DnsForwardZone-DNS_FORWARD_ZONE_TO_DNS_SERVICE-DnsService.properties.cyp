query = """MATCH (:DnsForwardZone)-[r:DNS_FORWARD_ZONE_TO_DNS_SERVICE]->(:DnsService)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
