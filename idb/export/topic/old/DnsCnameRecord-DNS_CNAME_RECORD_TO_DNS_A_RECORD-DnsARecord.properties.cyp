query = """MATCH (:DnsCnameRecord)-[r:DNS_CNAME_RECORD_TO_DNS_A_RECORD]->(:DnsARecord)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
