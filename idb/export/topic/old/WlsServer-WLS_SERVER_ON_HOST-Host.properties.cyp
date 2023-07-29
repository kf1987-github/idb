query = """MATCH (:WlsServer)-[r:WLS_SERVER_ON_HOST]->(:Host)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
