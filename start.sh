#!/bin/env bash

username = $(whoami)

wget https://github.com/wotomg/ddg-test/archive/main.tar.gz
tar -zxvf ddg-test-main.tar.gz
cd ddg-test-main
sudo bash install.sh $username
