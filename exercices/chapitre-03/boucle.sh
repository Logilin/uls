#! /bin/sh

nombre=200000

i=0

while [ $i -le $nombre ]
do
	i=$((i + 1))
done

echo "$@"
