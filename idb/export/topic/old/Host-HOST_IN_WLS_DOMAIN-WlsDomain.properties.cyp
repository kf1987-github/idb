query = """MATCH (:Host)-[r:HOST_IN_WLS_DOMAIN]->(:WlsDomain)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
