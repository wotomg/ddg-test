#!/bin/env bash

whoami > /tmp/username

wget -q https://github.com/wotomg/ddg-test/archive/main.tar.gz
tar -zxf main.tar.gz
cd ddg-test-main
echo "PLEASE ENTER ROOT PASSWORD"
su -c 'bash install.sh'
