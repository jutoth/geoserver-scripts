#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker pull docker.osgeo.org/geoserver:2.26.0

sudo docker run -d -it -p 8080:8080 \
  --env SKIP_DEMO_DATA=true --env GEOSERVER_ADMIN_USER=admin --env GEOSERVER_ADMIN_PASSWORD=geoserver \
  docker.osgeo.org/geoserver:2.26.0
