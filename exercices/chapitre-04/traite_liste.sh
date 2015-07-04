#! /bin/sh

while read nom_fichier
do
	echo -n "$nom_fichier : "
	if ! [ -f "$nom_fichier" ]
	then
		echo "invalide"
		continue
	fi
	
	md5sum "$nom_fichier"

done
