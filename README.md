# idb
Inventory Database application running from a docker container

---

# Overview

## Backend Neo4j graph database
Available at http://localhost:7474/browser/

## Frontend IDB application
Web application at http://localhost:8080/ using the javascript Neo4j driver to query the backend database.
- Tabulation of query data with javascript framework DataTables (https://datatables.net/).
- Visualization of graph data with javascript framework force-graph (https://github.com/vasturiano/force-graph), itself based on the d3 and d3-force framework (https://github.com/d3/d3-force).
