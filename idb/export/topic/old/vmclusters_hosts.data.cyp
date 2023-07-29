query = """match (n:Host)-->(c:VmCluster)
return {vm_cluster: c.vm_cluster, datacenter: c.datacenter, vm_host_type: c.vm_host_type, env: c.env, hostname: n.hostname, os_name: n.os_name, os_version: n.os_version};"""
