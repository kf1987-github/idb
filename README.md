# idb
Inventory Database application running from a docker container

---

# Overview

## Backend Neo4j graph database web UI
Available at http://localhost:7474/browser/
- using docker image neo4j:5.7.0-community (https://hub.docker.com/layers/library/neo4j/5.7.0-community/images/sha256-9ae58e94484dc656875403f50bdd71491cdffdd3ff0c444ad17e3f6798df21b7?context=explore)

## Frontend IDB web application
Web application at http://localhost:8080/ using the javascript Neo4j driver to query the backend database.
- Tabulation of query data with javascript framework DataTables (https://datatables.net/).
- Visualization of graph data with javascript framework force-graph (https://github.com/vasturiano/force-graph), itself based on the d3 and d3-force framework (https://github.com/d3/d3-force).
