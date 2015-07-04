#! /bin/sh


reponse=$(dialog							\
		--backtitle "Installation de mon application"		\
		--item-help						\
		--stdout						\
		--title "Début installation"				\
		--menu "Choix du type d'installation"	0 0 0		\
		"1" "Standard" "Installation nécessitant 300 Mo"	\
		"2" "Minimale" "Installation nécessitant 128 Mo"	\
		"3" "Complète" "Installation nécessitant 1.2 Go"	\
		"4" "Personnalisée" "Installation totalement personnelle")

if [ $? -ne 0 ]; then exit 1; fi

		dialog							\
		--backtitle "Installation de mon application"		\
		--stdout						\
		--title "Confirmation"					\
		--yesno "Voulez-vous commencer l'installation ?" 0 0

if [ $? -ne 0 ]; then exit 1; fi

reponse=$(dialog							\
		--backtitle "Installation de mon application"		\
		--stdout						\
		--title "Fichier de démarrage"				\
		--fselect "/usr/local/" 0 0)

(for i in $(seq 1 10) ; do sleep 1; echo $((i * 10)); done) |
	dialog	--backtitle "Installation de mon application"		\
		--title "Installation en cours"				\
		--gauge "Travail effectué : " 7 20 0


	dialog --backtitle "Installation de mon application"		\
		--infobox "Installation terminée !" 0 0
sleep 3
