query = """MATCH (:DatabaseMviewRemote)-[r:MVIEW_MASTER]->(:DbLink)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
