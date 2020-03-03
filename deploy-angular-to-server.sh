#!/bin/bash

PROJECT_PATH="/home/priya/Desktop/Projects/frontend"
DIST_PATH="/home/priya/Desktop/Projects/frontend/dist/frontend/"
PEM_PATH="/home/priya/Desktop/Projects/SSH/pem-file.pem"
USER="root"
IP="167.172.31.115"

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Angular Deployment started<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

cd $PROJECT_PATH

ng build; #--prod=true

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Build successfully<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

cd $DIST_PATH

sudo rm dist.zip

sudo zip -r dist.zip $DIST_PATH

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Uploading file to server<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

sudo ssh -i $PEM_PATH $USER@$IP "cd /var/www/html; sudo rm dist.zip"

sudo scp -i $PEM_PATH dist.zip $USER@$IP:/var/www/html/

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Unzip<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

sudo ssh -i $PEM_PATH $USER@$IP "cd /var/www/html; unzip dist.zip"

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Deployed successfully<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
