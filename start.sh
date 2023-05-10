#!/bin/env bash

whoami > /tmp/username

wget https://github.com/wotomg/ddg-test/archive/main.tar.gz
tar -zxvf main.tar.gz
cd ddg-test-main
su -c 'bash install.sh'
newgrp docker
docker-compose up -d
