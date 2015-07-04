#! /bin/sh

function action_sur_fichier
{
    local reponse
    local saisie
    echo "*********************************************"
    # Préparer la chaîne d'invite PS3
    PS3="Action sur $1 : "

    # proposer un menu Informations/Copier/Déplacer/Détruire/Retour
    select reponse in Informations Copier Déplacer Détruire Retour ; do
	
        # Agir en fonction de la réponse
        case $reponse in
            # Informations -> ls -l
            Informations ) echo ; ls -l $1 ; echo ;;
            # Copier -> demander nouveau nom puis cp
            Copier ) echo -n "Copier $1 vers ? "
                if ! read saisie ; then continue ; fi
                cp $1 $saisie ;;
            # Déplacer -> nouvel emplacement, mv, et sortie
            Déplacer ) echo -n "Nouvel emplacement pour $1 ? "
                if ! read saisie ; then continue ; fi
                mv $1 $saisie
                break ;;
            # Détruire -> rm -i puis sortie
            Détruire ) if rm -i $1 ; then break; fi ;;
            # Retour -> sortie
            Retour ) break ;;
            * ) if [ "$REPLY" = "0" ] ; then break ; fi
                echo "$REPLY n'est pas une réponse valide"
                echo ;;
        esac
    done
}
 
 
function liste_fichiers
{
    echo "*********************************************"
    # Préparer la chaîne d'invite PS3
    PS3="Fichier à traiter : "
	
    # Afficher une liste des fichiers et l'option Quitter
    select fichier in * Quitter ; do
	
       # Si demande de Quitter, retour en échec
        if [ "$fichier" == "Quitter" ] ; then return 1 ; fi
        # Sinon, action sur le fichier sélectionné
        # et retour en réussite
        if [ ! -z "$fichier" ] ; then
            action_sur_fichier $fichier
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
