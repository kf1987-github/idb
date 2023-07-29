query = """MATCH (:Host)-[r:HOST_IN_VMCLUSTER]->(:VmCluster)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
