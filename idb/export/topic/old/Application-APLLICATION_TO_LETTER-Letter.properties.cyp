query = """MATCH (:Application)-[r:APLLICATION_TO_LETTER]->(:Letter)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
