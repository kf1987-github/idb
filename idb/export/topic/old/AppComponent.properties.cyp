query = """MATCH (n:AppComponent)
   RETURN labels(n), keys(n), size(keys(n)), count(*);"""
