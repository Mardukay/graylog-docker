#!/bin/bash

command=$(cat <<EOF
-u admin:pft,bcm93 -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Requested-By: cli' 'http://192.168.0.102:9000/api/streams'
EOF
)

while read -r line
do
	body=$(cat <<EOF
'{
  "index_set_id": "6516a393775bae465dc754be",
  "matching_type": "AND",
  "remove_matches_from_default_stream": true,
  "description": "${line}",
  "rules": [
    {
      "field": "source",
      "description": "${line}",
      "type": 1,
      "inverted": false,
      "value": "${line}"
    }
  ],
  "title": "${line}",
  "content_pack": null
}'
EOF
)
	#echo ${body[@]}
	#echo curl ${command} -d ${body}
	eval $(echo curl ${command} -d ${body})
done < file_with_hostnames.txt

