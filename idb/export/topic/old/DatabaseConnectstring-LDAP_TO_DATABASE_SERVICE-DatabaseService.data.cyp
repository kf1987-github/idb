query = """MATCH (a:DatabaseConnectstring)-[r:LDAP_TO_DATABASE_SERVICE]->(b:DatabaseService)
   RETURN r {source_ldapentry_name: a.ldapentry_name, destination_database_service: b.database_service, .*};"""
