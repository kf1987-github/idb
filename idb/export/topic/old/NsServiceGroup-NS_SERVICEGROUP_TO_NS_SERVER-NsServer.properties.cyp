query = """MATCH (:NsServiceGroup)-[r:NS_SERVICEGROUP_TO_NS_SERVER]->(:NsServer)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
