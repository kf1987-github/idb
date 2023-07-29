query = """MATCH (:Application)-[r:APLLICATION_TO_COSMOS_TRANSACTION]->(:CosmosTransaction)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
