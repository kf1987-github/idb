query = "MATCH (:Database)-[r:DATABASE_ON_HOST]->(:Host) RETURN type(r), keys(r), size(keys(r)), count(*)"
