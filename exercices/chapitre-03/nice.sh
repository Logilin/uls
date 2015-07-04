#! /bin/sh

nice -n 20 ./boucle.sh "Fin script nice 20" &
nice -n 15 ./boucle.sh "Fin script nice 15" &
nice -n 10 ./boucle.sh "Fin script nice 10" &
nice -n  5 ./boucle.sh "Fin script nice 5"  &
nice -n  0 ./boucle.sh "Fin script nice 0"  &
