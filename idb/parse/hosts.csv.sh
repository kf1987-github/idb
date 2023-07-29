
. ../setenv.sh
SOURCEDIR=${SDIR}/source

WORKDIR=${SDIR}/parse
CSVDIR=${SDIR}/csv

SOURCE=host


### parse nodes: Host

OUT=${CSVDIR}/${SOURCE}.Host.nodes_01.csv
echo "HOST_NAME|DOMAIN|DC" > ${OUT}

cat ${SOURCEDIR}/host/hosts.out |sed '1d' |grep -v "^$" |tr ',' '|' >> ${OUT}
echo ${OUT}

