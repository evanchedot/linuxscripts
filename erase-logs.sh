#!/bin/bash
#erase-logs.sh
take(){
ls -d */
}
MODULES=$(take)
erasefunction(){
for i in $MODULES
do
rm ./$i/logs/*log.*
done
}
erasefunction
