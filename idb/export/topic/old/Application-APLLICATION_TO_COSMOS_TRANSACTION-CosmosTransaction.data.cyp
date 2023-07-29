query = """MATCH (a:Application)-[r:APLLICATION_TO_COSMOS_TRANSACTION]->(b:CosmosTransaction)
   RETURN r {source_application_name: a.application_name, destination_cosmos_transaction_name: b.cosmos_transaction_name, .*};"""
