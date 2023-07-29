query = """MATCH (:DnsService)-[r:DNS_SERVICE_ON_HOST]->(:Host)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
