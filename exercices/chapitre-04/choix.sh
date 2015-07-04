#! /bin/sh

cat <<- FIN

	Choisissez une option :
	
	1 - Creer une nouvelle archive
	2 - Transferer une archive sur bande
	3 - Envoyer une archive au serveur
	4 - Recuperer une ancienne archive
	5 - Lister le contenu d'une archive
	
	0 - Quitter
	
FIN

while true
do
	echo -n "Votre choix : "
	read reponse

	case "$reponse" in
		"1" ) echo "Pret a creer une nouvelle archive" ;;
		"2" ) echo "Pret a transferer une archive sur bande" ;;
		"3" ) echo "Pret a envoyer une archive au serveur" ;;
		"4" ) echo "Pret a recuperer une ancienne archive" ;;
		"5" ) echo "Prêt a lister le contenu d'une archive" ;;
		"0" ) echo "Au revoir..." ; exit 0 ;;
		* ) echo "Option $reponse inconnue" ;;
	esac
done
