#!/bin/bash
#docker-load.sh

loadfunction()
{
  TAKE=$(find / | grep images/action | awk -F "/" '{print $NF}')
  CHEMIN=$(find / | grep images/action | awk -F "/" '{print  $0}')
  touch temp.txt
  echo "$CHEMIN $TAKE" > temp.txt
  sed -i "s/$TAKE//g" temp.txt | head -1
  TROUVE=$(cat temp.txt)
  rm temp.txt
  cd $TROUVE
  IMAGES=./*
  for i in $IMAGES ; do
        docker load -i $i
  done
}
loadfunction
