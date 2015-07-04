#! /bin/sh

i=0

# tant que i est inferieur à 5 
while [ $i -lt 5 ] ; do
	# afficher les arguments de ligne de commande
	echo "$@"
	# dormir une seconde
	sleep 1
	# incrementer i
	i=$((i + 1))
done

