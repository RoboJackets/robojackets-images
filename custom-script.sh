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

# Install software dependencies
sudo ./robocup-software/util/ubuntu-setup --yes

# Install refbox dependencies
sudo apt-get install -y g++ git libgtkmm-2.4-dev libprotobuf-dev protobuf-compiler

# Compile things
cd robocup-software
make
cd ../ssl-refbox
make
cd ..
EOF

# Sublime :/
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer
