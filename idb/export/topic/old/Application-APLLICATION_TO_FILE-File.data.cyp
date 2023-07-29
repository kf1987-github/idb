query = """MATCH (a:Application)-[r:APLLICATION_TO_FILE]->(b:File)
   RETURN r {source_application_name: a.application_name, destination_file_name: b.file_name, .*};"""
