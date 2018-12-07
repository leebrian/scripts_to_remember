#!/usr/bin/env bash

# I want to data hoard a copy of all the notes from openmrs 18
# I want the url inside the file since I can't make it the name of the file


curl https://wiki.openmrs.org/display/RES/2018+Implementers%27+Conference+Schedule --silent|grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort | uniq|grep notes.open| while read -r line ; do
	file_name=$(echo $line|cut -d "/" -f4).txt
	echo "processing $line and $file_name at $(date)"
	echo "curled from $line at $(date)" > $file_name
	curl --header "Connection: keep-alive" $line/export/txt --silent >> $file_name
done

