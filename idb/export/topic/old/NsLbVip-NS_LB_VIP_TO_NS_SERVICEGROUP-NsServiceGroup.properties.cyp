query = """MATCH (:NsLbVip)-[r:NS_LB_VIP_TO_NS_SERVICEGROUP]->(:NsServiceGroup)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
