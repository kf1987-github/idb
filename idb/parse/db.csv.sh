
. ../setenv.sh
SOURCEDIR=${SDIR}/source

WORKDIR=${SDIR}/parse
CSVDIR=${SDIR}/csv

SOURCE=db

###
### parse nodes
###

### parse nodes: Database

OUT=${CSVDIR}/${SOURCE}.Database.nodes_01.csv
echo "DB_NAME|DB_VERSION|APP|ENV|HA|HOST" > ${OUT}

cat ${SOURCEDIR}/db/databases.txt |sed -n '1,2d;p' |tr ',' '|' >> ${OUT}
echo ${OUT}

### parse nodes: Table

OUT=${CSVDIR}/${SOURCE}.Table.nodes_01.csv
echo "PK_TABLE|DB_NAME|TABLE_NAME|OPTIONS|SOURCE_TYPE" > ${OUT}

cat ${SOURCEDIR}/db/tables.list |grep -v "^$" |tr ':' '|' \
                                |awk -F '|' '{print $1"."$2 "|" $0}' >> ${OUT}
echo ${OUT}

###
### parse properties
###

### parse properties: Database

OUT=${CSVDIR}/${SOURCE}.Database.properties_01.csv
echo "DB_NAME|PATCH_DATE|DB_OWNER" > ${OUT}

cat ${SOURCEDIR}/db/db_info.txt |sed '1d' |tr ':' '|' >> ${OUT}
echo ${OUT}

###
### parse relations
###

### parse relations: Table - Database

OUT=${CSVDIR}/${SOURCE}.Table-Database.relations_01.csv
echo "PK_TABLE|DB_NAME|SOURCE_TYPE" > ${OUT}

cat ${SOURCEDIR}/db/tables.list |grep -v "^$" |tr ':' '|' \
                                |awk -F '|' '{print $1"."$2 "|" $1 "|" $4}' >> ${OUT}
echo ${OUT}

