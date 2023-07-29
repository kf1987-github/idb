query = """MATCH (:DatabaseMviewRemote)-[r:MVIEW_ON_DATABASE]->(:Database)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
