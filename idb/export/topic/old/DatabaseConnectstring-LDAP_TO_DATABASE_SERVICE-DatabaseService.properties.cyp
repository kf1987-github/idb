query = """MATCH (:DatabaseConnectstring)-[r:LDAP_TO_DATABASE_SERVICE]->(:DatabaseService)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
