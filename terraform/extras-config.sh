#! /bin/bash

apt-get update
apt-get install -y docker.io
systemctl start docker
systemctl enable docker
HOSTNAME=$(hostname)
echo "Docker com Apache no $HOSTNAME" > /index.html
docker pull httpd:latest && docker run -d \
  --name apache_server \
  --restart always \
  -p 80:80 \
  -v /index.html:/usr/local/apache2/htdocs/index.html \
  httpd:latest

