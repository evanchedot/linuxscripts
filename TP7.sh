#!/bin/bash
#Script du TP6
createuserslist () {

        test -f /home/echedot/bin/createusers.log || touch /home/echedot/bin/createusers.log
	clear

	if [[ -f /tmp/listusers.txt ]] ; then
		loggin=$(sed -e '1~2 d' /tmp/listusers.txt)
		declare -i nb=1
		for i in $loggin ; do
			if useradd -c $(sed -n "$nb"' p' /tmp/listusers.txt) -m -s /bin/bash -p $(openssl passwd -6 iop) $i 2>/home/echedot/bin/createusers.log ; then
				echo -e "L'utilisateur $i a bien été créé. "
				nbrok=$(expr $nbrok + 1)
			else
				echo -e "Echec de la création de l'utilisateur $i. "
				nbrfail=$(expr $nbrfail + 1)
			fi
			nb+=2
		done
#		if [[ -n $(awk -F ":" '{print $1}'/etc/passwd | grep "evanchedotbis") ]] ; then
#				sed -e "s/$loggin//g" /tmp/listusers.txt			
#		fi
		if [[ -n $nbrok ]] ; then
			echo "$nbrok utilisateurs ont été créés"
			echo "$nbrfail utilisateurs n'ont pas été créés"
		else
			echo "$nbrfail utilisateurs n'ont pas été créés"
		fi
		echo "Les échecs de création des utilisateurs ont été reportés dans : /home/echedot/bin/createusers.logs"
	else
	
basename="$1"
nbcount="$2"
nbdef="$3"
chiffreok=0
chiffrefail=0

	if [[ -z "$basename" ]] ; then
	read -p "Veuillez renseigner une base de noms : " basename
	while [[ -z "$basename" ]] ; do
		read -p "Veuillez renseigner une base de noms : " basename
	done
	fi
	if [[ -z "$nbcount" ]] ; then
	read -p "Veuillez renseigner le nombre de comptes à créer : " nbcount
	while [[ -z "$nbcount" ]] ; do
	       read -p "Veuillez renseigner le nombre de comptes  à créer : " nbcount
       	done
        fi
        if [[ -z "$nbdef" ]] ; then
        read -p "Veuillez renseigner le numéro de début : " nbdef
        if [[ -z "$nbdef" ]] ; then
	        read -p "Si rien n'est renseigné, alors ce sera 1 par défaut: " nbdef
	     	if [[ -z "$nbdef" ]] ; then
			nbdef=1
		fi
        fi
        fi
	until [[ $nbcount -eq 0 ]] ; do
		if ! grep -qs '^'"$basename$nbdef"':' /etc/passwd ; then
			if useradd -m -s /bin/bash -p $(openssl passwd -6 iop) "$basename$nbdef" 2>/home/echedot/bin/createusers.log ; then
				passwd -e "$basename$nbdef" >/dev/null 2>&1
				echo -e "L'utilisateur $basename$nbdef a bien été créé. "
				chiffreok=$(expr "$chiffreok" + 1)
				nbdef=$(expr "$nbdef" + 1)
				nbcount=$(expr "$nbcount" - 1)
			else
				echo -e "Echec de la création de l'utilisateur : $basename$nbdef"
				chiffrefail=$(expr "$chiffrefail" + 1)
				nbdef=$(expr "$nbdef" + 1)
			fi
		fi
	done
        echo "$chiffreok utilisateurs ont été créés"
	echo "$chiffrefail utilisateurs n'ont pas été créés"
	echo "Les échecs de création des utilisateurs ont été reportés dans : /home/echedot/bin/createusers.log"	
	fi
	echo -e "$(date +%T) - Fin du script"
}
createuserslist
