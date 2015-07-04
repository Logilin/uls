#! /bin/bash

pacman ()
{
	initialisation_jeu
	while boucle_jeu ; do
		:
	done
	fin_jeu
}

incr()
{
	eval "$1"'=$(('$1'+'${2:-1}'))'
}

set_chaine ()
{
	eval $1'="${'$1':0:'$2'}'"$3"'${'$1':$(('$2'+1))}"'
}

initialisation_jeu ()
{

	if ! tput init ; then
		echo "Impossible d'initaliser le terminal" >&2
		exit 1
	fi
	

	stty -icanon -echo time 1 min 0
	HAUT=$(echo -e "\033[A\n")
	BAS=$(echo -e "\033[B\n")
	GAUCHE=$(echo -e "\033[D\n")
	DROITE=$(echo -e "\033[C\n")

	score_max=0
	score=0
	niveau=0
}

nouveau_tableau ()
{
	incr niveau
	
	i=0
	tableau[$i]="###########  ###########"; incr i
	tableau[$i]="#.........#  #.........#"; incr i
	tableau[$i]="#*####.##.#  #.##.####*#"; incr i
	tableau[$i]="#.####.....FF.....####.#"; incr i
	tableau[$i]="#......##.####.##......#"; incr i
	tableau[$i]="..####.##.#  #.##.####.."; incr i
	tableau[$i]="#.####....#  #....####.#"; incr i
	tableau[$i]="#......##.####.##......#"; incr i
	tableau[$i]="#.####.##...@..##.####.#"; incr i
	tableau[$i]="#*####....#  #....####*#"; incr i
	tableau[$i]="#......##.#  #.##......#"; incr i
	tableau[$i]="###########  ###########"; incr i

	unset x_fantome
	unset y_fantome
	nb_fantomes=0;
	
	tput setab 4
	tput clear
	tput civis

	tput setab 4
	tput setaf 6
	tput bold

	i=0
	while [ $i -lt ${#tableau[*]} ] ; do
		j=0
		while [ $j -lt ${#tableau[$i]} ] ; do
			n=${tableau[$i]:j:1}
			case "$n" in
				"#" )	tput setab 7
					echo -n " "
					tput setab 4 ;;
				"." )	incr score_max
					echo -n "." ;;
				"*" )	incr score_max 10
					tput setaf 1
					echo -n "*"
					tput setaf 6 ;;
				" " )	echo -n "$n" ;;
				"@" )	y_pacman=$i
					x_pacman=$j
					set_chaine tableau[$i] $j "."
					echo -n " " ;;
				"F" )	y_fantome[$nb_fantomes]=$i
					x_fantome[$nb_fantomes]=$j
					incr nb_fantomes;
					set_chaine tableau[$i] $j "."
					incr score_max ;
					echo -n "." ;;
			esac
			incr j
		done
		echo
		incr i
	done
	
	tput setab 6
	i=$(($i - 1))
	j=0;
	while [ $j -lt ${#tableau[$i]} ] ; do
	  echo -n " "
	  incr j
	done 
}



fin_jeu()
{
	tput reset
	stty sane
}

boucle_jeu ()
{
	nouveau_tableau
	dx1=0
	dy1=0
#	dx=0
#	dy=0
	while true ; do
		tput setab 4
		tput setaf 3
		tput bold
		tput enacs
		tput cup ${y_pacman} ${x_pacman}
                        echo -n "@"
		read
		case $REPLY in
			${HAUT}*   | u) dx1=0;  dy1=-1 ;;
			${BAS}*    | n) dx1=0;  dy1=1  ;;
			${GAUCHE}* | h) dx1=-1; dy1=0  ;;
			${DROITE}* | j) dx1=1;  dy1=0  ;;
			q) return 1 ;;
			p) pause=1 ;;
			*) ;;
		esac
		tput setab 4
		set_chaine tableau[$y_pacman] $x_pacman ' '
		tput cup ${y_pacman} ${x_pacman}
		echo -n "${tableau[$y_pacman]:$x_pacman:1}"

		if [ $score -eq $score_max ] ; then
			tput cup 10 10
			echo "Tableau terminé"
			sleep 5
			return 0
		fi

		x=$(($x_pacman + $dx1))
		y=$(($y_pacman + $dy1))
		if [ $y -lt 0 ] ; then y=$((${#tableau[*]} - 1)); fi
		if [ $y -ge ${#tableau[*]} ] ; then y=0; fi
		if [ $x -lt 0 ] ; then x=$((${#tableau[$y]} - 1)); fi
		if [ $x -ge ${#tableau[$y]} ] ; then x=0; fi
		n=${tableau[$y]:$x:1}
		case $n in
			" " | "." | "*" ) dx=$dx1; dy=$dy1 ;;
		esac
		x=$(($x_pacman + $dx))
		y=$(($y_pacman + $dy))
		if [ $y -lt 0 ] ; then y=$((${#tableau[*]} - 1)); fi
		if [ $y -ge ${#tableau[*]} ] ; then y=0; fi
		if [ $x -lt 0 ] ; then x=$((${#tableau[$y]} - 1)); fi
		if [ $x -ge ${#tableau[$y]} ] ; then x=0; fi
		n=${tableau[$y]:$x:1}
		case $n in
			" ")	y_pacman=$y; x_pacman=$x ;;
			".")	incr score;
				y_pacman=$y; x_pacman=$x ;;
			"*")	incr score 10;
				y_pacman=$y; x_pacman=$x ;;
		esac
		tput cup ${#tableau[*]} 0
		tput setab 6
		tput setaf 7
		tput bold
		echo -n " niveau $niveau, score $score "
	done
}

	pacman
