#! /bin/sh

explore_repertoire ()
{
	local f
	local i

	i=0
	while [ $i -lt $2 ] ; do
		echo -n " "
		i=$((i + 1))
	done
	echo "$1"

	if ! cd "$1" ; then return ; fi

	for f in * ; do
		if [ -L "$f" ] ; then
			continue
		fi

		if [ -d "$f" ] ; then
			explore_repertoire "$f" $(($2 + 4))
		fi
	done
	
	cd ..
}

for r in "$@" ; do
	explore_repertoire "$r" 0
	echo
done
