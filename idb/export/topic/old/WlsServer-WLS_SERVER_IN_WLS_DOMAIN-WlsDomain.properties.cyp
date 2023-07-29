query = """MATCH (:WlsServer)-[r:WLS_SERVER_IN_WLS_DOMAIN]->(:WlsDomain)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
