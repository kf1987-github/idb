#!/usr/bin/python

import json
import os
import sys

input_file = sys.argv[1]
columns = sys.argv[2]
column_list = columns.split(",")

json_file = open(input_file)
data = json.load(json_file)

csv_header = ""
i =  0
for c in column_list:
  if i == 0:
    csv_header = c.upper()
  else:
    csv_header = csv_header + "|" + c.upper()
  i = i+1
print(csv_header)

for r in data:
  csv_record = ""
  i = 0
  for c in column_list:
    if c in r:
      value = json.dumps(r.get(c))
      # remove quotes
      if len(value) > 0:
        value = value[1:-1]
    else:
      value = ""
    if i == 0:
      csv_record = value
    else:
      csv_record = csv_record + "|" + value
    i = i+1
  print(csv_record)


