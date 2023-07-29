query = """MATCH (n:DnsARecord)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
