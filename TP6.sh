#!/bin/bash
#Script du TP6
createusers () {
	clear

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
			if useradd -m -s /bin/bash -p $(openssl passwd -6 iop) "$basename$nbdef" 2>/home/echedot/bin/tp6.log ; then
				passwd -e "$basename$nbdef" >/dev/null 2>&1
				echo -e "L'utilisateur $basename$nbdef a bien été créé. "
				chiffreok=$(expr "$chiffreok" + 1)
			else
				echo -e "Echec de la création de l'utilisateur : $basename$nbdef"
				chiffrefail=$(expr "$chiffrefail" + 1)
			fi
			nbdef=$(expr "$nbdef" + 1)
			nbcount=$(expr "$nbcount" - 1)
		else
			nbdef=$(expr "$nbdef" + 1)
		fi
	done
        echo "$chiffreok utilisateurs ont été créés"
	echo "$chiffrefail utilisateurs n'ont pas été créés"
        test -f /home/echedot/bin/tp6.log || touch /home/echedot/bin/tp6.log
	echo "Les échecs de création des utilisateurs ont été reportés dans : /home/echedot/bin/tp6.log"	
	echo -e "$(date +%T) - Fin du script"

}
createusers
