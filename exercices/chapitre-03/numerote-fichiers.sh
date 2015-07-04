#! /bin/sh

compteur=1

for fichier in *
do
	echo "$compteur) $fichier"

	compteur=$(($compteur + 1))
done
