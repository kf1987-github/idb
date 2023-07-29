query = """MATCH (a:Application)-[r:APLLICATION_TO_LETTER]->(b:Letter)
   RETURN r {source_application_name: a.application_name, destination_letter_name: b.letter_name, .*};"""
