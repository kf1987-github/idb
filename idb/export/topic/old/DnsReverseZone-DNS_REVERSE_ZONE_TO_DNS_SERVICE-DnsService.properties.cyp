query = """MATCH (:DnsReverseZone)-[r:DNS_REVERSE_ZONE_TO_DNS_SERVICE]->(:DnsService)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
