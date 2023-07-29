query = """MATCH (:NsService)-[r:NS_SERVICE_TO_NS_SERVER]->(:NsServer)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
