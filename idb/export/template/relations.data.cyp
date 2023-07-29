query = "MATCH (a:<LABEL_SOURCE>)-[r:<RELATION_TYPE>]->(b:<LABEL_DESTINATION>) RETURN r {source_<pk_source>: a.<pk_source>, destination_<pk_destination>: b.<pk_destination>, .*}"
