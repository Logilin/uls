#! /bin/sh

function conversion_nom
{
	# l'ancien nom est le premier argument
	ancien="$1"
	# utiliser tr pour obtenir le nouveau nom
	nouveau=$(echo "$ancien" | tr "[:upper:]" "[:lower:]")
	# si les deux noms sont differents
	if [ "$ancien" != "$nouveau" ]; then
		mv -f "$ancien" "$nouveau"
	fi
}

if [ -z "$1" ] ; then
	echo "usage : $0 fichiers..." >&2
	exit 0
fi
	
while [ ! -z "$1" ] ; do
	if [ -e "$1" ] ; then
		conversion_nom "$1"
	else
		echo "$1 n'existe pas" >& 2
	fi
	shift
done

