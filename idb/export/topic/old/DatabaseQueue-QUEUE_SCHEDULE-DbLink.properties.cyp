query = """MATCH (:DatabaseQueue)-[r:QUEUE_SCHEDULE]->(:DbLink)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
