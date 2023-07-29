var topics = [
{"topic": "Database-DATABASE_ON_HOST-Host", "topic_type": "relations", "columns": ["source_db_name", "destination_host_name", "hosted_on"], "default_columns": ["source_db_name", "destination_host_name", "hosted_on"], "viewer": {query: "MATCH (a:Database)-[r:DATABASE_ON_HOST]->(b:Host) RETURN a, r, b", signature: {node_aliasses: ["a","b"], relation_aliasses: ["r"]} }, "browser": {query: "MATCH (a:Database)-[r:DATABASE_ON_HOST]->(b:Host) RETURN a.source_db_name, b.destination_host_name, r.hosted_on"} }
,
{"topic": "Database", "topic_type": "nodes", "columns": ["app", "db_name", "db_owner", "db_version", "env", "ha", "host", "patch_date"], "default_columns": ["db_name", "app", "env", "host"], "viewer": {query: "MATCH (a:Database) RETURN a", signature: {node_aliasses: ["a"], relation_aliasses: []} }, "browser": {query: "MATCH (a:Database) RETURN a.db_name, a.app, a.env, a.host, a.db_owner, a.db_version, a.ha, a.patch_date"} }
,
{"topic": "Host", "topic_type": "nodes", "columns": ["dc", "domain", "host_name"], "default_columns": ["host_name", "domain", "dc"], "viewer": {query: "MATCH (a:Host) RETURN a", signature: {node_aliasses: ["a"], relation_aliasses: []} }, "browser": {query: "MATCH (a:Host) RETURN a.host_name, a.domain, a.dc"} }
,
{"topic": "Table-TABLE_IN_DATABASE-Database", "topic_type": "relations", "columns": ["source_pk_table", "destination_db_name", "data_type"], "default_columns": ["source_pk_table", "destination_db_name", "data_type"], "viewer": {query: "MATCH (a:Table)-[r:TABLE_IN_DATABASE]->(b:Database) RETURN a, r, b", signature: {node_aliasses: ["a","b"], relation_aliasses: ["r"]} } }
,
{"topic": "Table", "topic_type": "nodes", "columns": ["db_name", "options", "pk_table", "source_type", "table_name"], "default_columns": ["db_name", "options", "pk_table", "source_type", "table_name"], "viewer": {query: "MATCH (a:Table) RETURN a", signature: {node_aliasses: ["a"], relation_aliasses: []} } }
,
{"topic": "hosts_summary", "topic_type": "reports", "columns": ["domain", "dc", "host_count"], "default_columns": ["domain", "dc", "host_count"]}
];

