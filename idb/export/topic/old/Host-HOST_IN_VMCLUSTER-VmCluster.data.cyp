query = """MATCH (a:Host)-[r:HOST_IN_VMCLUSTER]->(b:VmCluster)
   RETURN r {source_host: a.host, destination_vm_cluster: b.vm_cluster, .*};"""
