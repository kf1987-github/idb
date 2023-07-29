query = """MATCH (n:DnsConditionalForwarder)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
