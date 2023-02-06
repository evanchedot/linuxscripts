#!/bin/bash
askclientname(){
        read -p "Veuillez renseigner le nom du client : " clientname
        while [[ ! "$clientname" =~ ^[^[:space:]]+$ ]];
        do
                read -p "Le nom du client ne peut pas être vide et ne peut pas contenir d'espaces
Veuillez renseigner le nom du client : " clientname
        done
        read -p "Veuillez renseigner le mot de passe du client : " clientpassword
        while [[ ! "$clientpassword" =~ ^[^[:space:]]+$ ]];
        do
                read -p "Le mot de passe du client ne peut pas être vide et ne peut pas contenir d'espaces
Veuillez renseigner le mot de passe du client : " clientpassword
        done
}
askclientname
createuserdir(){
        if [[ -n $(id -u $clientname &> /dev/null) ]];
        then
                echo "User already exists, canceled. Exiting the process."
                exit 0
        else
                useradd $clientname --home /u/clients/$clientname --create-home -s /bin/false --groups clients -p $(openssl passwd -6 $clientpassword)
                chown root:root /u/clients/$clientname
                chmod 755 /u/clients/$clientname
        fi
}
createuserdir