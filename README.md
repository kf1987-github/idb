# idb
Inventory Database application running from a docker container.

---

# Overview

## Backend Neo4j Browser web interface
Available at http://localhost:7474/browser/
- using docker image neo4j:5.7.0-community (https://hub.docker.com/layers/library/neo4j/5.7.0-community/images/sha256-9ae58e94484dc656875403f50bdd71491cdffdd3ff0c444ad17e3f6798df21b7?context=explore)
- default credentials are neo4j/docker4j (see below: Running the docker image as a docker container)

## Frontend idb web application
Web application at http://localhost:8080/ using the javascript Neo4j driver (https://unpkg.com/neo4j-driver@5.7.0/lib/browser/neo4j-web.js) to query the backend Neo4j graph database.
- Tabulation of query data with javascript framework DataTables (https://datatables.net/).
- Visualization of graph data with javascript framework force-graph (https://github.com/vasturiano/force-graph), itself based on the d3 and d3-force framework (https://github.com/d3/d3-force).

# Manual

## Running the idb application
#@# Building the docker image
- set up a docker installation (tested on Ubuntu 18.04.6 LTS using https://docs.docker.com/engine/install/ubuntu/)
- pull the idb source code to a local directory <IDB_DIR>
- from a terminal, change directory to <IDB_DIR>
- build the image using the Dockerfile issuing: docker build . --tag idb:idb-1.0
#@# Running the docker image as a docker container
- run the docker image issuing: docker run --rm --publish=7474:7474 --publish=7687:7687 --publish=8080:8080 --env NEO4J_AUTH=neo4j/docker4j idb:idb-0.34
- the container takes a minute to spin up and once loaded will output messages like: Transaction with id 1 has been automatically rolled back due to transaction timeout.
#@# Connecting to the idb application and the Neo4j Browser
- now you can connect to the idb web application at http://localhost:8080/
- you can also browse the database directly using the Neo4j Browser at http://localhost:7474/browser/
#@# Connecting to the docker container (optionally)
- list all running docker containers using: docker ps
- connect with a shell to a docker container using: docker exec -it <container_name>
#@# Stopping the docker container
- to stop the docker container press ctrl+c

## Managing the data loading process

## Managing the idb application settings
### Default column values in the Tabulation of query data
### Custom cypher query Reports

