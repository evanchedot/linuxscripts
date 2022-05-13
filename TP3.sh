#!/bin/bash
#Script du TP3
rep=pwd
extension=txt
func(){
	echo "Répertoire de travail : " $rep
	echo "Fichiers pouvant être traités : "
        $rep | ls *.$extension
	read -p "Quel fichier voulez-vous traiter ? " fic
	nblign= wc -l $fic
	debut= wc -l | head -n 2 $fic
	fin= wc -l | tail -n 2 $fic	
	echo "CARACTERISTIQUES DE " $fic
}
func
