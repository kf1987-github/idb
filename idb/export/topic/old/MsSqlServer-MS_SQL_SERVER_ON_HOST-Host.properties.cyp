query = """MATCH (:MsSqlServer)-[r:MS_SQL_SERVER_ON_HOST]->(:Host)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
