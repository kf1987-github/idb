query = """MATCH (:OsbBusinessService)-[r:OSB_DEPENDENCY]->(:OsbProxyService)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
