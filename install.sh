#!/usr/bin/env bash

#is root?
if [ "$EUID" -ne 0 ]
  then echo "Please run as root\nREAD THE MANUAL!"
  exit
fi

# INSTALLING DOCKER
apt-get install -y ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl start docker.service
systemctl enable docker.service

if [[ systemctl is-active --quiet docker && systemctl is-enabled --quiet docker ]]; then
  echo "Docker is runing and activated on system boot"
  else
    echo "!!!!!!!!!!!\nSOMETHING WENT WRONG\n!!!!!!!!!!!"
fi

/sbin/usermod -aG docker $1

# INSTALLING PROMETHEUS
wget -P /tmp/ https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz

tar -zxvf /tmp/node_exporter-1.5.0.linux-amd64.tar.gz -C /opt/

mv /opt/node_exporter-1.5.0.linux-amd64/ /opt/node_exporter/

/sbin/useradd -M -U node_exporter -s /bin/false

chown node_exporter:node_exporter /opt/node_exporter/ -R

cp etc/node_exporter.service /etc/systemd/system/node_exporter.service

systemctl daemon-reload

systemctl start node_exporter.service
