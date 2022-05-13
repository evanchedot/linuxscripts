#!/bin/bash
#Script du TP4
nom="$1"
if [[ "$#" -gt 1 ]] ; then 
	echo "Utilisation du script : <TP4.sh>'nom_du_process'"
	exit 3
fi
if [[ -n "$nom" ]] ; then
	echo "Liste des processus contenant : $nom"
	ps -aux | head -n 1
	ps -aux | grep "$nom"
fi
if [[ -z "$nom" ]] ; then
	read -p "Veuillez saisir un nom de process à rechercher : " saisie
else
	if [[ -n "$saisie" ]] ; then
        echo "Liste des processus contenant : $saisie"
	ps -aux | head -n 1
	ps -aux | grep "$saisie"	
fi
if [[ -z "$saisie" ]] ; then
	saisie=$(whoami)
	echo "Liste des processus contenant : $saisie"
        ps -aux | head -n 1
	ps -aux | grep "$saisie"	
else 
	echo "Liste des processus contenant : $saisie"
        ps -aux | head -n 1
	ps -aux | grep "$saisie"	
fi

