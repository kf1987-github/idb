query = """match (h:Host)-->(w:WlsDomain)
with w.wls_domain_name as wls_domain_name, w.wls_version as wls_version, collect(h.host) as hosts
return {wls_domain_name: wls_domain_name, wls_version: wls_version, wls_hosts: reduce(s=hosts[0], i in tail(hosts) | s + ',' + i)};"""
