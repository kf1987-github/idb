query = """MATCH (:Database)-[r:DB_LINK]->(:DbLink)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
