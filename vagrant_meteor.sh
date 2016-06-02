#!/bin/bash

git config --global user.email "hmj@goatpage.com"
git config --global user.name "HMJ"

curl https://install.meteor.com/ | sh
mkdir /home/vagrant/meteorapp
cp -r /vagrant/.meteor /home/vagrant/meteorapp/.meteor
sudo mount --bind /home/vagrant/meteorapp/.meteor/ /vagrant/.meteor/
