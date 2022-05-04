#!/bin/bash
#cert-renew
docker=/home/lumiplan/docker/commons

func(){
cd $docker
docker compose run --rm certbot renew
}
func
