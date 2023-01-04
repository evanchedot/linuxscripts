#!/bin/bash
#restart-instances.sh

func(){
read -p "Ce script redémarre tous les conteneurs - Etes-vous sur ? (o/n) " answer
  while [[ -z $answer ]] ; do
      read -p "Ce script redémarre tous les conteneurs - Etes-vous sur ? (o/n) " answer
  done
  case $answer in
  o|O)      sudo -s
            INSTANCES=$(find /u/siv* -type d -name siv*)
            docker stop $(docker ps -a -q)
            for i in $INSTANCES ; do
            cd $i
            docker compose up -d
            sleep 15
        done
        COMMONS=$(find /u -type d -name commons)
        cd $COMMONS
        docker compose up -d ;;
   n|N)  exit 0 ;;

   *) echo "Réponse inexacte, Veuillez-réessayer " ;;
 esac
}
func
