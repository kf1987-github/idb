query = """MATCH (:DbLink)-[r:DBLINK_TO_DATABASE_SERVICE]->(:DatabaseService)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
