query = """MATCH (:AppComponent)-[r:APPCOMPONENT_TO_APPLICATION]->(:Application)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
