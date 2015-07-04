#! /bin/sh

options=$-

while [ -n "$options" ]
do
	echo set -${options:0:1}
	options=${options:1}
done
