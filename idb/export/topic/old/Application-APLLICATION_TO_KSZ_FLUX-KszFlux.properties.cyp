query = """MATCH (:Application)-[r:APLLICATION_TO_KSZ_FLUX]->(:KszFlux)
   RETURN type(r), keys(r), size(keys(r)), count(*);"""
