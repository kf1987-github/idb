query = """MATCH (a:DnsService)-[r:DNS_SERVICE_ON_HOST]->(b:Host)
   RETURN r {source_dns_service_name: a.dns_service_name, destination_host: b.host, .*};"""
