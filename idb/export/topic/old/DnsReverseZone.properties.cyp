query = """MATCH (n:DnsReverseZone)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
