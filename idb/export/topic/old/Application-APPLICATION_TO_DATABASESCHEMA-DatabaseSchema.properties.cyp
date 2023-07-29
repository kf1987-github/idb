query = """MATCH (:Application)-[r:APPLICATION_TO_DATABASESCHEMA]->(:DatabaseSchema)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
