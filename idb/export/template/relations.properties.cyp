query = "MATCH (:<LABEL_SOURCE>)-[r:<RELATION_TYPE>]->(:<LABEL_DESTINATION>) RETURN type(r), keys(r), size(keys(r)), count(*)"
