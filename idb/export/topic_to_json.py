#!/usr/bin/python

import json
import os
import sys

topic = sys.argv[1]
topic_type = sys.argv[2]
columns = sys.argv[3]
default_columns = sys.argv[4]
column_list = columns.split(",")
default_columns_list = default_columns.split(",")

dict = {}
dict["topic"] = topic
dict["topic_type"] = topic_type
dict["columns"] = column_list
dict["default_columns"] = default_columns_list

print(json.dumps(dict))


