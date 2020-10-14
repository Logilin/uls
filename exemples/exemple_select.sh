#! /bin/sh

action_sur_fichier()
{
    local reponse
    local saisie
    echo "*********************************************"
    # Preparer la chaine d'invite PS3
    PS3="Action sur $1 : "

    # proposer un menu
    select reponse in Informations Copier Deplacer Detruire Retour ; do

        # Agir en fonction de la repose
        case "$reponse" in
            # Informations -> ls -l
            Informations ) echo ; ls -l "$1" ; echo ;;
            # Copier -> demander nouveau nom puis cp
            Copier ) echo -n "Copier $1 vers ? "
                if ! read saisie ; then continue ; fi
                cp "$1" "$saisie" ;;
            # Deplacer -> nouvel emplacement, mv, et sortie
            Deplacer ) echo -n "Nouvel emplacement pour $1 ? "
                if ! read saisie ; then continue ; fi
                mv "$1" "$saisie"
                break ;;
            # Detruire -> rm -i puis sortie
            Detruire ) if rm -i "$1" ; then break; fi ;;
            # Retour -> sortie
            Retour ) break ;;
            * ) if [ "$REPLY" = "0" ] ; then break ; fi
                echo "$REPLY n'est pas une reponse valide"
                echo ;;
        esac
    done
}


liste_fichiers()
{
    echo "*********************************************"
    PS3="Fichier a traiter : "

    # Afficher une liste des fichiers et l'option Quitter
    select fichier in * Quitter ; do

       # Si demande de Quitter, retour en echec
        if [ "$fichier" = "Quitter" ] ; then return 1 ; fi
        # Sinon, action sur le fichier selectionne
        # et retour en reussite
        if [ -n "$fichier" ] ; then
            action_sur_fichier "$fichier"
            return 0
        fi
    done
}


while true
do
	if ! liste_fichiers
	then
		break
	fi
done
