#!/bin/bash
#start-modules.sh
MODULES=*/*.sh
startfunction(){
for i in $MODULES
do
sudo $i start
done
}
startfunction
