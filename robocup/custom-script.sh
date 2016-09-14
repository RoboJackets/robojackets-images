#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment

# Install needed dependencies
sudo apt-get update
sudo apt-get install -y git qtcreator

# Make sure we are using the vagrant user
su vagrant << EOF
# CD to home dir
cd
# Clone all needed projects
git clone https://github.com/RoboJackets/robocup-software.git
git clone https://github.com/RoboJackets/robocup-firmware.git
git clone https://github.com/RoboCup-SSL/ssl-refbox.git

git -C robocup-software submodule update --init --recursive
git -C robocup-firmware submodule update --init --recursive
git -C ssl-refbox submodule update --init --recursive

# Install software dependencies
./robocup-software/util/ubuntu-setup --yes

# Install firmware dependencies
./robocup-firmware/util/ubuntu-setup --yes

# Install refbox dependencies
sudo apt-get install -y g++ git libgtkmm-2.4-dev libprotobuf-dev protobuf-compiler

# Compile things
cd robocup-software
make
cd ../robocup-firmware
# make robot2015
cd ../ssl-refbox
make
cd rcon-client
make
cd ../
sudo chown vagrant:vagrant -R ./robocup-software/external
sudo chown vagrant:vagrant -R ./robocup-firmware/external
cd ../
EOF

# Sublime :/
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer
