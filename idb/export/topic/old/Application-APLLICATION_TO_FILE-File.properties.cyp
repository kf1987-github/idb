query = """MATCH (:Application)-[r:APLLICATION_TO_FILE]->(:File)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
