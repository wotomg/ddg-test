#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

wget -P /tmp/ https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz

tar -zxvf /tmp/node_exporter-1.5.0.linux-amd64.tar.gz -C /opt/

mv /opt/node_exporter-1.5.0.linux-amd64/ /opt/node_exporter/

/sbin/useradd -M -U node_exporter -s /bin/false

chown node_exporter:node_exporter /opt/node_exporter/ -R

cp etc/node_exporter.service /etc/systemd/system/node_exporter.service

systemctl daemon-reload

systemctl start node_exporter.service

systemctl enable node_exporter.service
