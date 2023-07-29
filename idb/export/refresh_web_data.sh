
if [ "${IDB_ENV}" != "set" ]
then
  echo "IDB ERROR  No env IDB_ENV set. Please run . /idb/setenv.sh to set env."
  exit
fi

WORKDIR=${SDIR}/export

cd ${WORKDIR}

OUTDIR=$WORKDIR/out
TEMPLATE_DIR=$WORKDIR/template
TOPIC_DIR=$WORKDIR/topic

generate_export(){
  TOPIC_TYPE=$1
  TOPIC=$2
  echo "generating $TOPIC_TYPE $TOPIC"

  ### properties js
  OUT_PROPERTIES=$OUTDIR/${TOPIC}.properties.list
  PROPERTIES_CYP=$TOPIC_DIR/${TOPIC}.properties.cyp
  CUSTOM_PROPERTIES=$TOPIC_DIR/${TOPIC}.properties.txt
  if [ ! -f $CUSTOM_PROPERTIES ]
  then
    OUT_PROPERTIES_PY=$OUTDIR/${TOPIC}.properties.py
    cat $TEMPLATE_DIR/${TOPIC_TYPE}.properties.py |sed -n '1,/<QUERY_DEFINITION>/ p'|sed '$ d' > $OUT_PROPERTIES_PY
    cat $PROPERTIES_CYP >> $OUT_PROPERTIES_PY
    cat $TEMPLATE_DIR/${TOPIC_TYPE}.properties.py |sed -n '/<QUERY_DEFINITION>/,$ p'|sed '1 d' >> $OUT_PROPERTIES_PY
    python $OUT_PROPERTIES_PY > $OUT_PROPERTIES
  else
    cat $CUSTOM_PROPERTIES > $OUT_PROPERTIES
  fi
  # add pk's for source and destination nodes, in case of relations
  if [ "${TOPIC_TYPE}" = "relations" ]
  then
    TMP_PROP=/tmp/relation_properties.$$.out
    L_SRC=$(echo $I|cut -d'-' -f1)
    L_DST=$(echo $I|cut -d'-' -f3)
    PK_SRC="source_"$(cat $CONSTRAINTS_OUT|grep "^$L_SRC|" |cut -d'|' -f2)
    PK_DST="destination_"$(cat $CONSTRAINTS_OUT|grep "^$L_DST|" |cut -d'|' -f2)
    echo $PK_SRC > $TMP_PROP
    echo $PK_DST >> $TMP_PROP
    cat $OUT_PROPERTIES >> $TMP_PROP
    cat $TMP_PROP > $OUT_PROPERTIES
    rm $TMP_PROP
  fi

  ### data json
  OUT_JSON=$OUTDIR/${TOPIC}.json
  DATA_CYP=$TOPIC_DIR/${TOPIC}.data.cyp
  OUT_DATA_PY=$OUTDIR/${TOPIC}.py
  cat $TEMPLATE_DIR/${TOPIC_TYPE}.data.py |sed -n '1,/<QUERY_DEFINITION>/ p'|sed '$ d' > $OUT_DATA_PY
  cat $DATA_CYP >> $OUT_DATA_PY
  cat $TEMPLATE_DIR/${TOPIC_TYPE}.data.py |sed -n '/<QUERY_DEFINITION>/,$ p'|sed '1 d' >> $OUT_DATA_PY
  python $OUT_DATA_PY > $OUT_JSON

  ### data csv
  OUT_CSV=$OUTDIR/${TOPIC}.csv
  COLUMNS=$(echo $(cat $OUT_PROPERTIES)|tr ' ' ',')
  python $WORKDIR/json_to_csv.py $OUT_JSON $COLUMNS > $OUT_CSV

  ### topic js
  # for use in javascript
  OUT_JS=$OUTDIR/${TOPIC}.js
  DEFAULT_COLUMNS_FILE=$TOPIC_DIR/${TOPIC}.properties.default.txt
  if [ ! -f $DEFAULT_COLUMNS_FILE ]
  then
    DEFAULT_COLUMNS_FILE=$OUT_PROPERTIES
  fi
  DEFAULT_COLUMNS=$(echo $(cat $DEFAULT_COLUMNS_FILE)|tr ' ' ',')
  python $WORKDIR/topic_to_json.py $TOPIC $TOPIC_TYPE $COLUMNS $DEFAULT_COLUMNS > $OUT_JS

  ### copy to web_dir
  echo "copy data to web_dir"
  mkdir -p ${WEB_DIR}/json
  mkdir -p ${WEB_DIR}/csv
  cp $OUT_JSON $WEB_DIR/json
  cp $OUT_CSV $WEB_DIR/csv
}

### clear outdir
rm -rf $OUTDIR/*.json
rm -rf $OUTDIR/*.py
rm -rf $OUTDIR/*.js
rm -rf $OUTDIR/*.csv
rm -rf $OUTDIR/*.list
rm -rf $OUTDIR/*.out

### get schema info
echo "collecting labels"
LABELS_OUT=$OUTDIR/labels.out
python get.labels.py |tr -d '"[] ' > $LABELS_OUT
echo "collecting relation_types"
RELATION_TYPES_OUT=$OUTDIR/relation_types.out
python get.relation_types.py |tr -d '"[] '|tr ',' '|' > $RELATION_TYPES_OUT
echo "collecting constraints"
CONSTRAINTS_OUT=$OUTDIR/constraints.out
python get.constraints.py |tr -d '"'|cut -d':' -f2|sed 's:[ ].*[.]:|:'|sed 's:[ ].*$::' > $CONSTRAINTS_OUT

### generate nodes
for I in $(cat $LABELS_OUT)
do
  cat $TEMPLATE_DIR/nodes.data.cyp |sed "s:<LABEL>:$I:" > $TOPIC_DIR/${I}.data.cyp
  cat $TEMPLATE_DIR/nodes.properties.cyp |sed "s:<LABEL>:$I:" > $TOPIC_DIR/${I}.properties.cyp
  generate_export nodes $I
done

### generate relations
for I in $(cat $RELATION_TYPES_OUT |grep -v "PACKAGE_ON_HOST")
do
  L_SRC=$(echo $I|cut -d'|' -f1)
  L_DST=$(echo $I|cut -d'|' -f3)
  REL=$(echo $I|cut -d'|' -f2)
  PK_SRC=$(cat $CONSTRAINTS_OUT|grep "^$L_SRC|" |cut -d'|' -f2)
  PK_DST=$(cat $CONSTRAINTS_OUT|grep "^$L_DST|" |cut -d'|' -f2)
  I=$(echo $I|tr '|' '-')
  cat $TEMPLATE_DIR/relations.data.cyp |sed "s#<RELATION_TYPE>#$REL#" \
   |sed "s#<LABEL_SOURCE>#$L_SRC#" |sed "s#<LABEL_DESTINATION>#$L_DST#" \
   |sed "s#<pk_source>#$PK_SRC#g" |sed "s#<pk_destination>#$PK_DST#g" > $TOPIC_DIR/${I}.data.cyp
  cat $TEMPLATE_DIR/relations.properties.cyp |sed "s#<RELATION_TYPE>#$REL#" \
   |sed "s#<LABEL_SOURCE>#$L_SRC#" |sed "s#<LABEL_DESTINATION>#$L_DST#" > $TOPIC_DIR/${I}.properties.cyp
  generate_export relations $I
done

### generate reports
generate_export reports hosts_summary
# generate_export reports some_other_custom_report

### create topics.out
echo "compiling topics"
TMP_JS=/tmp/topics.$$.js
TOPICS_OUT=$OUTDIR/topics.out
echo "var topics = [" > $TMP_JS
for I in $(ls $OUTDIR/*.js)
do
  cat $I >> $TMP_JS
  echo "," >> $TMP_JS
done
cat $TMP_JS |sed '$ s/^,$/];/' > $TOPICS_OUT

### copy topics to web_dir
echo "copy topics to web_dir"
cp $TOPICS_OUT $WEB_DIR/topics.js

### cleanup
rm $TMP_JS


