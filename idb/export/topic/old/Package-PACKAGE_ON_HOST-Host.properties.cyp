query = """MATCH (:Package)-[r:PACKAGE_ON_HOST]->(:Host)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
