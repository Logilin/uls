#! /bin/sh

function oui_ou_non
{
	while true; do
		echo "$@"
		echo -n "(O/N) > "
		if ! read reponse ; then return 1 ; fi
		case $reponse in
			[oO0yY]* ) return 0 ;;
			[nN]* ) return 1 ;;
		esac
	done
}


if oui_ou_non "Etes-vous certains de vouloir effacer le fichier ?" ; then
	echo "Effacement en cours."
else
	echo "Effacement annule."
fi

