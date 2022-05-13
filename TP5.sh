#!/bin/bash
#Script du TP5
creacompte (){
	nom=$1
	read -p "Quel action souhaitez-vous réaliser ?
	1) Création du compte utilisateur 
	2) Reset du mot de passe 
	3) Attribution droit sudoers au compte
	4) Suppresion droit sudoers au compte
	5) Desactivation complète du compte 
	" answer
	case $answer in
		1 ) 
			useradd -p "$(openssl passwd -6 uiop)" "$nom"
			chage -d 0 "$nom" ;;
		2 )
			passwd -d "$nom" 
			chage -d0 "$nom" ;;
		3 )
			usermod -a -G sudo "$nom" ;;
		4 ) 
			deluser sudo "$nom" ;;
		5 )
			usermod -e1 "$nom" ;;
		* )
			echo "Réponse non correct, veuillez répondre par 1, 2, 3, 4 ou 5" ;;
	esac
}
creacompte
