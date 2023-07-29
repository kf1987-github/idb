query = """MATCH (a:AppComponent)-[r:APPCOMPONENT_TO_APPLICATION]->(b:Application)
   RETURN r {source_appcomponent_name: a.appcomponent_name, destination_application_name: b.application_name, .*};"""
