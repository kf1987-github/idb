query = """MATCH (:DatabaseService)-[r:SERVICE_ON_DATABASE]->(:Database)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
