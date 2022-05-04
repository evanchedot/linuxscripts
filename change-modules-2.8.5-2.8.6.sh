#!/bin/bash
#change-modules.sh
################ NE PAS OUBLIER DE FAIRE DANS LE CMD "sed -i 's/client/"nom_du_client"/g' au préalable !! #######################
FILES=/u/produit-modulaire/client/*/*.sh
FILESMOD=/home/lumiplan/MODIF/
TOMCAT=/u/tomcat/tomcat_client
IHMs=/var/www/html
MODULES=/u/produit-modulaire/client
part-modules(){
      cd $MODULES
      test -f $FILESMOD/action*.jar && cp $FILESMOD/action*.jar action
      test -f $FILESMOD/importation*.jar && cp $FILESMOD/importation*.jar importation
      test -f $FILESMOD/moduleTTS*.jar && cp $FILESMOD/moduleTTS*.jar moduleTTS
      test -f $FILESMOD/moteurTTS*.jar && cp $FILESMOD/moteurTTS*.jar moteurTTS
      test -f $FILESMOD/parametrage*.jar && cp $FILESMOD/parametrage*.jar parametrage
      test -f $FILESMOD/sae*.jar && cp $FILESMOD/sae*.jar sae
      test -f $FILESMOD/schedule*.jar && cp $FILESMOD/schedule*.jar schedule
      test -f $FILESMOD/surveillance-*.jar && cp $FILESMOD/surveillance-*.jar surveillance
      test -f $FILESMOD/surveillanceSAE*.jar && cp $FILESMOD/surveillanceSAE*.jar surveillanceSAE
      test -f $FILESMOD/times*.jar && cp $FILESMOD/times*.jar times
      test -f $FILESMOD/transmission-*.jar && cp $FILESMOD/transmission-*.jar transmission
      test -f $FILESMOD/transmissionD2LP*.jar && cp $FILESMOD/transmissionD2LP*.jar transmissionD2LP
      test -f $FILESMOD/transmissionHTML*.jar && cp $FILESMOD/transmissionHTML*.jar transmissionHTML
      test -f $FILESMOD/transmissionPLOT_TFT*.jar && cp $FILESMOD/transmissionPLOT_TFT*.jar transmissionPLOT_TFT
}
part-modules
changeline(){
      cd $MODULES
      test -f action/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' action/*.sh
      test -f action/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' action/*.sh
      test -f importation/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' importation/*.sh
      test -f importation/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' importation/*.sh
      test -f moduleTTS/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' moduleTTS/*.sh
      test -f moduleTTS/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' moduleTTS/*.sh
      test -f parametrage/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' parametrage/*.sh
      test -f parametrage/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' parametrage/*.sh
      test -f sae/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' sae/*.sh
      test -f sae/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' sae/*.sh
      test -f schedule/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' schedule/*.sh
      test -f schedule/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' schedule/*.sh
      test -f surveillance/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' surveillance/*.sh
      test -f surveillance/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' surveillance/*.sh
      test -f surveillanceSAE/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' surveillanceSAE/*.sh
      test -f surveillanceSAE/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' surveillanceSAE/*.sh
      test -f times/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' times/*.sh
      test -f times/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' times/*.sh
      test -f transmission/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' transmission/*.sh
      test -f transmission/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' transmission/*.sh
      test -f transmissionD2LP/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' transmissionD2LP/*.sh
      test -f transmissionD2LP/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' transmissionD2LP/*.sh
      test -f transmissionHTML/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' transmissionHTML/*.sh
      test -f transmissionHTML/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' transmissionHTML/*.sh
      test -f transmissionPLOT_TFT/*2.8.5*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.5/g' transmissionPLOT_TFT/*.sh
      test -f transmissionPLOT_TFT/*2.8.6*.jar && sed -i -r 's/VERSION=[0-9].[0-9].[0-9]/VERSION=2.8.6/g' transmissionPLOT_TFT/*.sh
}
changeline
show(){
      for i in $FILES
      do
      head -n 13 $i | tail -n 3
      done
}
LIGNES=$(show)
echo $LIGNES
part-tomcats(){
      test -e $TOMCAT/tomcat_ihm && mv $TOMCAT/tomcat_ihm/webapps/services.war $TOMCAT/tomcat_ihm/webapps/services.war.old
      test -e $TOMCAT/tomcat_ihm && cp $FILESMOD/services.* $TOMCAT/tomcat_ihm/webapps/
      test -e $TOMCAT/tomcat_ihm && mv $TOMCAT/tomcat_ihm/webapps/services.war.2* $TOMCAT/tomcat_ihm/webapps/services.war
      test -e $TOMCAT/tomcat_siri && mv $TOMCAT/tomcat_siri/webapps/SiriDeliveryServices.war $TOMCAT/tomcat_siri/webapps/SiriDeliveryServices.war.old
      test -e $TOMCAT/tomcat_siri && cp $FILESMOD/SiriDeliveryServices.* $TOMCAT/tomcat_siri/webapps/
      test -e $TOMCAT/tomcat_siri && mv $TOMCAT/tomcat_siri/webapps/SiriDeliveryServices.war.2* $TOMCAT/tomcat_siri/webapps/SiriDeliveryServices.war
      test -e $TOMCAT/tomcat_html && mv $TOMCAT/tomcat_html/webapps/servicesHTML.war $TOMCAT/tomcat_html/webapps/servicesHTML.war.old
      test -e $TOMCAT/tomcat_html && cp $FILESMOD/servicesHTML.* $TOMCAT/tomcat_html/webapps/
      test -e $TOMCAT/tomcat_html && mv $TOMCAT/tomcat_html/webapps/servicesHTML.war.2* $TOMCAT/tomcat_html/webapps/servicesHTML.war
}
part-tomcats
part-ihm(){
      cd $IHMs
      sudo cp -R $FILESMOD/TravelOS.2.8.6 ./
      test -e TravelOS_client.old && sudo rm -rf TravelOS_client.old
      sudo mv TravelOS_client TravelOS_client.old
      sudo mv TravelOS.2.8.6 TravelOS_client
      cd TravelOS_client
      cp ../TravelOS_client.old/env.js ./
      cp ../TravelOS_client.old/index.html ./
      cp -R ../TravelOS_client.old/audio ./
      cp -R ../TravelOS_client.old/assets/images ./assets
      cd ..
      test -e tft_client && sudo cp -R $FILESMOD/tft.2.8.6 ./
      test -e tft_client.old && sudo rm -rf tft_client.old
      test -e tft.2.8.6 && sudo mv tft_client tft_client.old
      test -e tft.2.8.6 && sudo mv tft.2.8.6 tft_client
      test -e tft_client && cd tft_client
      test -e $IHMs/tft_client && cp ../tft_client.old/env.js ./
      test -e $IHMs/tft_client && cp ../tft_client.old/index.html ./
      test -e $IHMs/tft_client && cp -R ../tft_client.old/assets/img ./assets
      test -e $IHMs/tft_client && cp -R ../tft_client.old/data ./
      test -e pgd_client && sudo cp -R $FILESMOD/pgd.2.8.6 ./
      test -e pgd_client.old && sudo rm -rf pgd_client.old
      test -e pgd.2.8.6 && sudo mv pgd_client pgd_client.old
      test -e pgd.2.8.6 && sudo mv pgd.2.8.6 pgd_client
      test -e pgd_client && cd $IHMS/pgd_client
      test -e $IHMs/pgd_client && cp ../pgd_client.old/env.js ./
      test -e $IHMs/pgd_client && cp ../pgd_client.old/index.html ./
      test -e $IHMs/pgd_client && cp -R ../pgd_client.old/assets/img ./assets
      sudo chown -R lumiplan:lumiplan $IHMs/TravelOS_client
      test -e tft_client && sudo chown -R lumiplan:lumiplan $IHMs/tft_client
      test -e pgd_client && sudo chown -R lumiplan:lumiplan $IHMS/pgd_client
      chcon -R -h -t httpd_sys_content_t /var/www/html
}
part-ihm
part-bdd(){
      backup=/u/produit-modulaire/backupBDD
      test -e $backup || mkdir $backup
      cd $FILESMOD/schemas
      echo "DANS UN PREMIER TEMPS, INDIQUER LE MOT DE PASSE UTILISATEUR LINUX, puis remplir pour chaque << Enter Password: >> le mot de passe de la base de données "
      mdpbdd=tail -n 1 $MODULES/action/cfg/database.properties
      echo " Pour rappel le mot de passe MariaDB de ce serveur est : " $mdpbdd
      test -f $FILESMOD/schemas/siv.sql && sudo mysqldump -u root -p siv_client > $backup/siv_client.sql
      test -f $FILESMOD/schemas/siv.sql && sed -i 's/USE siv/USE siv_client/g' siv.sql
      test -f $FILESMOD/schemas/siv.sql && sudo mysql -u root -p siv_client < siv.sql
      test -f $FILESMOD/schemas/transmission.sql && sudo mysqldump -u root -p transmission_client > $backup/transmission_client.sql
      test -f $FILESMOD/schemas/transmission.sql && sed -i 's/USE transmission/USE transmission_client/g' transmission.sql
      test -f $FILESMOD/schemas/transmission.sql && sudo mysql -u root -p transmission_client < transmission.sql
      test -e /u/produit-modulaire/client/transmissionHTML && sudo mysqldump -u root -p transmission_html_client > $backup/transmission_html_client.sql
      test -e /u/produit-modulaire/client/transmissionHTML && sed -i 's/USE transmission_html/USE transmission_html_client/g' transmission_html.sql
      test -e /u/produit-modulaire/client/transmissionHTML && sudo mysql -u root -p transmission_html_client < transmission_html.sql
      cd $FILESMOD/donnees
      test -f $FILESMOD/donnees/siv.sql && sed -i 's/USE siv/USE siv_client/g' siv.sql
      test -f $FILESMOD/donnees/siv.sql && sudo mysql -u root -p siv_client < siv.sql
      test -f $FILESMOD/donnees/transmission.sql && sed -i 's/USE transmission/USE transmission_client/g' transmission.sql
      test -f $FILESMOD/donnees/transmission.sql && sudo mysql -u root -p transmission_client < transmission.sql
      cd $FILESMOD/schemas
      test -e /u/produit-modulaire/client/importation && mysqldump -u root -p test_client > $backup/test_client.sql
      test -e /u/produit-modulaire/client/importation && sed -i 's/USE siv_client/USE test_client/g' siv.sql
      test -e /u/produit-modulaire/client/importation && sudo mysql -u root -p test_client < siv.sql
      cd $FILESMOD/donnees
      test -e /u/produit-modulaire/client/importation && sed -i 's/USE siv_client/USE test_client/g' siv.sql
      test -e /u/produit-modulaire/client/importation && sudo mysql -u root -p test_client < siv.sql
}
part-bdd
part-write-files(){
      sudo yum install dos2unix
      cd $MODULES
      test -e action && read -p "Lignes à écrire dans action.properties (o/n) ?  " actionanswer
case $actionanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" actionwrite
                echo $actionwrite | tee -a action/cfg/action.properties && dos2unix action/cfg/action.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e  importation && read -p "Lignes à écrire dans importation.properties (o/n) ?  " importationanswer
case $importationanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" importationwrite
                echo $importationwrite | tee -a importation/cfg/importation.properties && dos2unix importation/cfg/importation.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e moduleTTS && read -p "Lignes à écrire dans moduleTTS.properties (o/n) ?  " moduleTTSanswer
case $moduleTTSanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" moduleTTSwrite
                echo $moduleTTSwrite | tee -a moduleTTS/cfg/moduleTTS.properties && dos2unix moduleTTS/cfg/moduleTTS.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e parametrage && read -p "Lignes à écrire dans parametrage.properties (o/n) ?  " parametrageanswer
case $parametrageanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" parametragewrite
                echo $parametragewrite | tee -a parametrage/cfg/parametrage.properties && dos2unix parametrage/cfg/parametrage.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e sae && read -p "Lignes à écrire dans sae.properties (o/n) ?  " saeanswer
case $saeanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" saewrite
                echo $saewrite | tee -a sae/cfg/sae.properties && dos2unix sae/cfg/sae.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e schedule && read -p "Lignes à écrire dans schedule.properties (o/n) ?  " scheduleanswer
case $scheduleanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" schedulewrite
                echo $schedulewrite | tee -a schedule/cfg/schedule.properties && dos2unix schedule/cfg/schedule.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e surveillance && read -p "Lignes à écrire dans surveillance.properties (o/n) ?  " surveillanceanswer
case $surveillanceanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" surveillancewrite
                echo $surveillancewrite | tee -a surveillance/cfg/surveillance.properties && dos2unix surveillance/cfg/surveillance.properties;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e surveillanceSAE && read -p "Lignes à écrire dans surveillanceSAE.properties (o/n) ?  " surveillanceSAEanswer
case $surveillanceSAEanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" surveillanceSAEwrite
                echo $surveillanceSAEwrite | tee -a surveillanceSAE/cfg/surveillanceSAE.properties && dos2unix surveillanceSAE/cfg/surveillanceSAE.properties;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e times && read -p "Lignes à écrire dans times.properties (o/n) ?  " timesanswer
case $timesanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" timeswrite
                echo $timeswrite | tee -a times/cfg/times.properties && dos2unix times/cfg/times.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e transmission && read -p "Lignes à écrire dans transmission.properties (o/n) ?  " transmissionanswer
case $transmissionanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" transmissionwrite
                echo $transmissionwrite | tee -a transmission/cfg/transmission.properties && dos2unix transmission/cfg/transmission.properties;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e transmissionD2LP && read -p "Lignes à écrire dans transmissionD2LP.properties (o/n) ?  " transmissionD2LPanswer
case $transmissionD2LPanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" transmissionD2LPwrite
                echo $transmissionD2LPwrite | tee -a transmissionD2LP/cfg/transmissionD2LP.properties && dos2unix transmissionD2LP/cfg/transmissionD2LP.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e transmissionHTML && read -p "Lignes à écrire dans transmissionHTML.properties (o/n) ?  " transmissionHTMLanswer
case $transmissionHTMLanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" transmissionHTMLwrite
                echo $transmissionHTMLwrite | tee -a transmissionHTML/cfg/transmissionHTML.properties && dos2unix transmissionHTML/cfg/transmissionHTML.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e transmissionPLOT_TFT && read -p "Lignes à écrire dans transmissionPLOT_TFT.properties (o/n) ?  " transmissionPLOT_TFTanswer
case $transmissionPLOT_TFTanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" transmissionPLOT_TFTwrite
                echo $transmissionPLOT_TFTwrite | tee -a transmissionPLOT_TFT/cfg/transmissionPLOt_TFT.properties && dos2unix transmissionPLOT_TFT/cfg/transmissionPLOT_TFT.properties;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
cd /u/tomcat/tomcat_client
test -e tomcat_ihm && read -p "Lignes à écrire dans tomcat_ihm (framework.properties) (o/n) ?  " frameworkanswer
case $frameworkanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" frameworkwrite
                echo $frameworkwrite | tee -a tomcat_ihm/app_conf/framework.properties && dos2unix tomcat_ihm/app_conf/framework.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e tomcat_siri && read -p "Lignes à écrire dans tomcat_siri (services.properties) (o/n) ?  " servicesanswer
case $servicesanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" serviceswrite
                echo $serviceswrite | tee -a tomcat_siri/app_conf/services.properties && dos2unix tomcat_siri/app_conf/services.properties ;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
test -e tomcat_html && read -p "Lignes à écrire dans tomcat_html (servicesHTML.properties) (o/n) ?  " servicesHTMLanswer
case $servicesHTMLanswer in
        O|o)
                read -p "Renseigner le texte ci-dessous
" servicesHTMLwrite
                echo $servicesHTMLwrite | tee -a tomcat_html/app_conf/servicesHTML.properties && dos2unix tomcat_html/app_conf/servicesHTML.properties;;

        N|n)
                echo "Ctrl+C pour passer toute cette étape" ;;


        *)
                echo "Veuillez repondre par oui ou par non" ;;
esac
}
part-write-files
part-restart(){
      cd /u/produit-modulaire/client
      ./stop-modules.sh start
      ./start-modules.sh start
      cd /u/tomcat/tomcat_client
      ./stop-tomcats.sh start
      ./start-tomcats.sh start
}
part-restart
echo "DONE"
