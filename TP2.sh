#!/bin/bash
#Script du TP2
func(){
	echo "Bonjour, cette machine est fin prête pour scripter ..."
	echo "Scripts shell présent ici : " 
	ls *.sh
	echo -e '\n'
	echo "Informations relatives à l'interpréteur bash : "
	$SHELL --version | head -n 1
	echo $PATH
	echo "/etc/skel/.bashrc"
	whereis -b bash
	whereis -m bash
	echo "Mise à jour disponible ? "
	apt list --upgradable bash
}
func
