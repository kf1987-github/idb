query = """MATCH (n:DnsService)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
