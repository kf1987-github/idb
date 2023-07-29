query = """MATCH (:NsCsPolicy)-[r:NS_CS_POLICY_TO_NS_CS_ACTION]->(:NsCsAction)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
