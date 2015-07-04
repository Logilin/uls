#! /bin/sh

# afficher $1 en eliminant tout apres le dernier / compris, suivi d'un /
echo ${1%/*}/

# afficher $1 en eliminant tout jusqu'au dernier / compris
echo ${1##*/}
