query = """MATCH (a:Application)-[r:APLLICATION_TO_KSZ_FLUX]->(b:KszFlux)
   RETURN r {source_application_name: a.application_name, destination_ksz_flux_name: b.ksz_flux_name, .*};"""
