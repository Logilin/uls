#! /bin/sh

for arg in "$@"
do
	path=$PATH
	while [ -n "$path" ]
	do
		rep=${path%%:*}
		path=${path#$rep}
		path=${path#:}
		if [ -e "${rep}/${arg}" ]
		then
			echo "${rep}/${arg}"
		fi
	done
done
