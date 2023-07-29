query = """MATCH (:DnsPtrRecord)-[r:DNS_PTR_RECORD_TO_DNS_REVERSE_ZONE]->(:DnsReverseZone)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
