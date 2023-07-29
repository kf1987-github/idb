query = """MATCH (:DatabaseQueue)-[r:QUEUE_ON_DATABASE]->(:Database)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
