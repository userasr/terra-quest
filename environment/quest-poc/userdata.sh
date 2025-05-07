#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
docker pull dockerasr/rearc-quest:v1
docker run -d --name quest-poc -p 3000:3000 -e SECRET_WORD='quest001001222' dockerasr/rearc-quest:v1
