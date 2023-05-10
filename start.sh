#!/bin/env bash

username = $(whoami)

wget https://github.com/wotomg/ddg-test/archive/main.tar.gz
tar -zxvf main.tar.gz
cd ddg-test-main
su -c 'bash install.sh $username'
docker-compose up -d
