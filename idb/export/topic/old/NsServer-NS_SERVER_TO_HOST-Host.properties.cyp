query = """MATCH (:NsServer)-[r:NS_SERVER_TO_HOST]->(:Host)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
