query = """MATCH (:NsLbVip)-[r:NS_LB_VIP_TO_NS_SERVICE]->(:NsService)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
