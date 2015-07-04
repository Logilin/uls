#! /bin/sh

compare_motif_et_chaine ()
{
	# Le motif est le premier argument, la chaine le second.
	case $2 in
		$1 ) return 0 ;;
	esac
	return 1
}


motif="$1"
chaine="$2"

echo -n "$chaine : "

if compare_motif_et_chaine "$motif" "$chaine" ; then
	echo "Oui"
else
	echo "Non"
fi
