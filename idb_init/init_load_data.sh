#!/bin/bash

. /idb/setenv.sh

while [ ! -f ${NEO4J_HOME}/logs/neo4j.log ] || [ "$(grep Started ${NEO4J_HOME}/logs/neo4j.log)" = "" ]
do
  echo "IDB INFO  Waiting for neo4j to be Started."
  sleep 1
done

echo "IDB INFO  Loading data into neo4j."
/idb/get_data.sh -a

echo "IDB INFO  Exporting data from neo4j for idb_viewer."
python /idb/export/get.schema_info.py

cp /idb/export/topics_default.json ${WEB_DIR}
chmod 744 ${WEB_DIR}/topics_default.json
chown neo4j:neo4j ${WEB_DIR}/topics_default.json
