query = """MATCH (:NsCsVip)-[r:NS_CS_VIP_TO_NS_CS_POLICY]->(:NsCsPolicy)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
