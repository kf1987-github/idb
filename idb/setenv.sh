# NEO4J_HOME is set automatically by underlying neo4j docker image to /var/lib/neo4j
# NEO4J_AUTH is set manually on startup of docker container via option: --env NEO4J_AUTH=user/pwd

export IDB_ENV=set

export SDIR=/idb
export WEB_DIR=/var/www/idb_viewer

export NEO_USER=$(echo ${NEO4J_AUTH} |cut -d'/' -f1)
export NEO_PWD=$(echo ${NEO4J_AUTH} |cut -d'/' -f2)
export NEO_HOST=0.0.0.0
export NEO_PORT=7474
export NEO_DB=neo4j

export CYPHER_PATH=${NEO4J_HOME}/bin
export NEO4J_IMPORTDIR=${NEO4J_HOME}/import

