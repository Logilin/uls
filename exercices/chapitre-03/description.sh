#! /bin/sh

for i in "$@" ; do
	echo "$i : "
	if [ -L "$i" ] ; then echo "  (lien symbolique) " ; fi
	if [ ! -e "$i" ] ; then 
		echo "  n'existe pas"
		continue
	fi
	echo -n "  type = "
		if [ -b "$i" ] ; then echo "special bloc " ; fi
		if [ -c "$i" ] ; then echo "special caractere " ; fi
		if [ -d "$i" ] ; then echo "repertoire " ; fi
		if [ -f "$i" ] ; then echo "fichier regulier " ; fi
		if [ -p "$i" ] ; then echo "tube nomme " ; fi
		if [ -S "$i" ] ; then echo "socket " ; fi
	echo -n "  acces = "
		if [ -r "$i" ] ; then echo -n "lecture " ; fi
		if [ -w "$i" ] ; then echo -n "ecriture " ; fi
		if [ -x "$i" ] ; then echo -n "execution " ; fi
		echo ""
		if [ -G "$i" ] ; then echo "  a mon groupe" ; fi
		if [ -O "$i" ] ; then echo "  a moi" ; fi
done

