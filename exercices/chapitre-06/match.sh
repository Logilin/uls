#! /bin/sh

expression=$1
shift

for arg in "$@"; do
	if echo "$arg" | grep -E "$expression" > /dev/null 2>&1 ; then
		echo "$arg : oui"
	else
		echo "$arg : non"
	fi
done
