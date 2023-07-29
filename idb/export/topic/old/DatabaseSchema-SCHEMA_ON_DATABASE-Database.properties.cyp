query = """MATCH (:DatabaseSchema)-[r:SCHEMA_ON_DATABASE]->(:Database)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
