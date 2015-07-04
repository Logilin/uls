#! /bin/sh

# obtenir l'annee en cours grace a la commande date
annee_en_cours=$(date +"%Y")

# calculer l'annee suivante grace a une construction $((...))
annee_suivante=$(($annee_en_cours + 1))

# appeler cal avec, en argument, l'annee suivante calculee
cal $annee_suivante

