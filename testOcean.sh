#!/bin/bash

declare -i index=0
declare -i index2=0
IP=$(ip a | grep inet | grep ens | awk '{print $2}' | awk -F "/" '{print $1}')
nomhote=$(hostname)
if [[ -z $(/u/exec/scripts/logs >& /dev/null) ]];
then
  mkdir /u/exec/scripts/logs
fi
if [[ -z $(/u/exec/scripts/logs/testOcean.log >& /dev/null) ]];
then
  touch /u/exec/scripts/logs/testOcean.log
fi
if [[ -z $(/u/exec/scripts/logs/result_stats.txt >& /dev/null) ]];
then
  touch /u/exec/scripts/logs/result_stats.txt
fi
if [[ -z $(/u/exec/scripts/logs/result_login.txt >& /dev/null) ]];
then
  touch /u/exec/scripts/logs/result_login.txt
fi
if [[ -z $(/u/exec/scripts/logs/output_stats.txt >& /dev/null) ]];
then
  touch /u/exec/scripts/logs/output_stats.txt
fi
if [[ -z $(/u/exec/scripts/logs/output_login.txt >& /dev/null) ]];
then
  touch /u/exec/scripts/logs/output_login.txt
fi
curl -c /u/cookie.txt -o logs/result_login.txt http://127.0.0.1:9191/ocean/login?user_name=admin 2> logs/output_login.txt
input="logs/output_login.txt"
while IFS= read -r line
do
  index=$index+1
  if [ "$index" -eq 3 ];
  then
	if [[ $line == *"100 "* ]];
	then
		curl -b /u/cookie.txt -o logs/result_stats.txt --max-time 20 http://127.0.0.1:9191/ocean/stats 2> logs/output_stats.txt

		input2="logs/output_stats.txt"
		while IFS= read -r line2
		do
		  index2=$index2+1
		  if [ "$index2" -eq 3 ];
		  then
			echo "ligne 3"
			echo $line2
			if [[ $line2 == *"100"* ]];
			then
				echo "test stats OK"
			fi
		  fi
		  if [ "$index2" -eq 4 ];
		  then
			if [[ $line2 == *"Operation timed out after "* ]];
			then
				echo "test stats NOK ==> restart Ocean"
				PID=`ps -edf | grep [o]cean | awk '{print $2}'`
				if [ ! -z $PID ]
				then
					echo -n $"Killing Ocean : $PID"
					kill -9 $PID >& /dev/null
          rm -rf /u/ocean/felix-cache
				fi
				sleep 5
				/u/ocean/ocean.script start
        sleep 3
        instances=$(find /u/produit-modulaire/*/update -type d)
        for i in $instances
        do
          actual=$(echo $i | awk -F "/" '{print $4}')
          cd /u/produit-modulaire/$actual
          if [[ -n transmission/ ]];
          then
            transmission/transmission.sh stop
            transmission/transmission.sh start
            sleep 5
          fi
          if [[ -n transmissionD2LP/ ]];
          then
            transmissionD2LP/transmissionD2LP.sh stop
            transmissionD2LP/transmissionD2LP.sh start
            sleep 5
          fi
          if [[ -n transmissionHTML/ ]];
          then
            transmissionHTMTL/transmissionHTML.sh stop
            transmissionHTML/transmissionHTML.sh start
            sleep 5
            transmissionPLOT_TFT/transmissionPLOT_TFT.sh stop
            transmissionPLOT_TFT/transmissionPLOT_TFT.sh start
            sleep 3
          fi
        done
        echo -e "Le serveur ayant pour adresse IP : $IP a recontré un problème avec Ocean. Le script de redémarrage automatique a déclenché cette alerte. \nUne vérification du serveur est tout de même fortement recommandée" | mailx -r nepasrepondre@lumiplan.com -s $nomhote support.logiciel@lumiplan.com christophe.blejan@lumiplan.com
			fi
		  fi
        done < "$input2"
	else
	  echo "test login NOK"
	fi
  fi
done < "$input"
