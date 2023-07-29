#!/bin/bash

nohup /idb_init/init_load_data.sh &
nohup /usr/sbin/apache2ctl start &

