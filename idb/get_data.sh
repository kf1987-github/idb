#!/bin/bash

usage() {
        echo "Options:"
        echo ""
        echo "  -a          : run all stages for loading data: equivalent to setting all options -c -l"
        echo "  -c          : create csv data from source data"
        echo "  -l          : load csv data into neo4j db"
        echo "  -f <filter>          : (optional) filter actions based on <filter>, for example 'db' or 'host'"
        echo "  -F <field separator> : (optional) field separator used when generating cypher load scripts"
        echo "                         the default is '|' (pipe) and it cannot be ':' (colon)"
        echo ""
        echo "  h : help"
}

debug (){
   echo "# $(date --rfc-3339=s) IDB INFO  $1"
}

if [ "${IDB_ENV}" != "set" ]
then
  echo "IDB ERROR  No env IDB_ENV set. Please run . /idb/setenv.sh to set env."
  exit
fi

WORKDIR=${SDIR}

PARSEDIR=${WORKDIR}/parse
CSVDIR=${WORKDIR}/csv
LOADDIR=${WORKDIR}/load

CYPHER_SHELL="${CYPHER_PATH}/cypher-shell --non-interactive -u ${NEO_USER} -p ${NEO_PWD}"

ALL_DATA=""
CSV_DATA=""
LOAD_DATA=""
FILTER=""
FS_DEFAULT="|"
FS="|"
while getopts aclhf:F: OPTION ;
     do
             case "${OPTION}" in
                     a) ALL_DATA="yes";;
                     c) CSV_DATA="yes";;
                     l) LOAD_DATA="yes";;
                     f) FILTER="${OPTARG}";;
                     F) FS="${OPTARG}";;
                     h) usage;exit;;
             esac
     done

if [ -z "${ALL_DATA}" -a -z "${CSV_DATA}" -a -z "${LOAD_DATA}" ]
then
   usage
   exit
fi

### CSV_DATA = yes

if [ -n "${ALL_DATA}" -o -n "${CSV_DATA}" ]
then
   debug "generating csv files"
   cd ${PARSEDIR}
   for I in $(ls *.csv.sh |grep "${FILTER}")
   do
      debug "${I}"
      ${PARSEDIR}/${I}
   done
fi

### LOAD_DATA = yes

if [ -n "${ALL_DATA}" -o -n "${LOAD_DATA}" ]
then
   cd ${CSVDIR}
   debug "generating load statements for nodes"
   SEDTMP=/tmp/load.$$.sed
   for I in $(ls *.nodes*.csv |grep "${FILTER}")
   do
      echo ${CSVDIR}/${I}
      FILE=${CSVDIR}/${I}
      NODETYPE=$(echo ${FILE}|cut -d. -f2)
      FS_FILE=${LOADDIR}/$(echo ${I}|sed 's:csv$:fs:')
      if [ -f "${FS_FILE}" ]
      then
         FS="$(head -1 ${FS_FILE}| cut -d' ' -f1)"
      else
         FS="${FS_DEFAULT}"
      fi
      UNIQUE_PROPERTY=$(head -1 ${FILE}|cut -d ${FS} -f1)
      unique_property=$(echo ${UNIQUE_PROPERTY} |tr [:upper:] [:lower:])
      SET_PROPERTIES=""
      for P in $(head -1 ${FILE}|tr ${FS} ' ')
      do
         TAIL="s.$(echo ${P}|tr [:upper:] [:lower:])=line.${P}"
         SET_PROPERTIES="${SET_PROPERTIES}, ${TAIL}"
      done
      SET_PROPERTIES=$(echo ${SET_PROPERTIES} |sed 's:^, ::')
    
      echo "s:<CSVFILE>:${I}:g"                        > ${SEDTMP}
      echo "s:<NODETYPE>:${NODETYPE}:g"                >> ${SEDTMP}
      echo "s:<unique_property>:${unique_property}:g"  >> ${SEDTMP}
      echo "s:<UNIQUE_PROPERTY>:${UNIQUE_PROPERTY}:g"  >> ${SEDTMP}
      echo "s:<SET_PROPERTIES>:${SET_PROPERTIES}:g"    >> ${SEDTMP}
      echo "s:<FS>:${FS}:g"                            >> ${SEDTMP}
   
      sed -f ${SEDTMP} ${LOADDIR}/templates/nodes.cyp > ${LOADDIR}/$(echo ${I}|sed 's:csv$:cyp:')
   done
   rm -rf ${SEDTMP}
   
   debug "generating load statements for properties"
   SEDTMP=/tmp/load.$$.sed
   for I in $(ls *.properties*.csv |grep "${FILTER}")
   do
      echo ${CSVDIR}/${I}
      FILE=${CSVDIR}/${I}
      NODETYPE=$(echo ${FILE}|cut -d. -f2)
      FS_FILE=${LOADDIR}/$(echo ${I}|sed 's:csv$:fs:')
      if [ -f "${FS_FILE}" ]
      then
         FS="$(head -1 ${FS_FILE}| cut -d' ' -f1)"
      else
         FS="${FS_DEFAULT}"
      fi
      UNIQUE_PROPERTY=$(head -1 ${FILE}|cut -d ${FS} -f1)
      unique_property=$(echo ${UNIQUE_PROPERTY} |tr [:upper:] [:lower:])
      SET_PROPERTIES=""
      for P in $(head -1 ${FILE}|tr ${FS} ' ')
      do
         TAIL="s.$(echo ${P}|tr [:upper:] [:lower:])=line.${P}"
         SET_PROPERTIES="${SET_PROPERTIES}, ${TAIL}"
      done
      SET_PROPERTIES=$(echo ${SET_PROPERTIES} |sed 's:^, ::')
    
      SEDTMP=/tmp/load.${I}.$$.sed
      echo "s:<CSVFILE>:${I}:g"                        > ${SEDTMP}
      echo "s:<NODETYPE>:${NODETYPE}:g"                >> ${SEDTMP}
      echo "s:<unique_property>:${unique_property}:g"  >> ${SEDTMP}
      echo "s:<UNIQUE_PROPERTY>:${UNIQUE_PROPERTY}:g"  >> ${SEDTMP}
      echo "s:<SET_PROPERTIES>:${SET_PROPERTIES}:g"    >> ${SEDTMP}
      echo "s:<FS>:${FS}:g"                            >> ${SEDTMP}
   
      sed -f ${SEDTMP} ${LOADDIR}/templates/properties.cyp > ${LOADDIR}/$(echo ${I}|sed 's:csv$:cyp:')
   done
   rm -rf ${SEDTMP}
   
   cd ${CSVDIR}
   debug "copy csv files to neo4j import directory"
   rm -rf ${NEO4J_IMPORTDIR}/*.csv
   cp *.csv ${NEO4J_IMPORTDIR}
   
   cd ${LOADDIR}
   debug "load constraints"
   for I in $(ls constraints.cyp)
   do
      FILE=${LOADDIR}/${I}
      echo ${FILE}
      cat ${FILE} |${CYPHER_SHELL} >${FILE}.out
   done
   
   cd ${LOADDIR}
   debug "load indexes"
   for I in $(ls indexes.cyp)
   do
      FILE=${LOADDIR}/${I}
      echo ${FILE}
      cat ${FILE} |${CYPHER_SHELL} >${FILE}.out
   done
   
   cd ${LOADDIR}
   debug "load nodes"
   for I in $(ls *.nodes*.cyp |grep "${FILTER}")
   do
      FILE=${LOADDIR}/${I}
      echo ${FILE}
      cat ${FILE} |${CYPHER_SHELL} >${FILE}.out
   done
   
   cd ${LOADDIR}
   debug "load properties"
   for I in $(ls *.properties*.cyp |grep "${FILTER}")
   do
      FILE=${LOADDIR}/${I}
      echo ${FILE}
      cat ${FILE} |${CYPHER_SHELL} >${FILE}.out
   done
   
   cd ${LOADDIR}
   debug "load relations"
   for I in $(ls *.relation*.cyp |grep "${FILTER}")
   do
      FILE=${LOADDIR}/${I}
      echo ${FILE}
      cat ${FILE} |${CYPHER_SHELL} >${FILE}.out
   done

   cd ${LOADDIR}
   debug "post steps"
   for I in $(ls *.post_steps*.cyp)
   do
      FILE=${LOADDIR}/${I}
      echo ${FILE}
      cat ${FILE} |${CYPHER_SHELL} >${FILE}.out
   done

fi

debug "finished"
