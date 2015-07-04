#! /bin/sh

# on veut lire les lignes sans decoupage
IFS=''

n=0
while read ligne[$n] ; do
	n=$(($n + 1))
done

while [ $n -gt 0 ] ; do
	n=$(($n - 1))
	echo "${ligne[$n]}"
done

