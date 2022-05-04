#!/bin/bash
#docker-load.sh
IMAGES=images/*
loadfunction()
{
        for i in $IMAGES
        do
        docker load -i $i
        done
}
loadfunction
