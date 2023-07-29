query = """MATCH (:MsSqlServerDatabase)-[r:MS_SQL_SERVER_DATABASE_ON_MS_SQL_SERVER]->(:MsSqlServer)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
