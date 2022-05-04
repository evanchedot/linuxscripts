#!/bin/bash
#stop-modules.sh
MODULES=*/*.sh
stopfunction(){
for i in $MODULES
do
sudo $i stop
done
}
stopfunction
