query = """MATCH (:NsCsAction)-[r:NS_CS_ACTION_TO_NS_LB_VIP]->(:NsLbVip)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
