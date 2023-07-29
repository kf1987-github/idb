query = """MATCH (n:VmCluster)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
