query = """MATCH (n:DnsForwardZone)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
