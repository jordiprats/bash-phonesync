#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ];
then
	echo "usage: $0 <source> <destination>"
	exit 1
fi

for i in $(find $1 -iname \*JPG -or -iname \*MOV);
do
	TS_FILE=$(stat -c '%Y' $i)
	YEAR_FILE=$(date -d @${TS_FILE} +%Y)	
	DATA_FILE=$(date -d @${TS_FILE} +%Y-%m-%d)	

	echo mkdir -p "$2/${YEAR_FILE}/${DATA_FILE}"

	echo cp "$i" "$2/${YEAR_FILE}/${DATA_FILE}/${TS_FILE}_$(basename $i)"

	if [[ "${YEAR_FILE}" != "2022" ]];
	then
		echo rm "$i"
	fi

done
