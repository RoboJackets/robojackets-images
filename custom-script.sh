#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
sudo apt-get update
sudo apt-get install -y git
cd
git clone https://github.com/RoboJackets/robocup-software.git
git clone https://github.com/RoboJackets/robocup-firmware.git
git clone https://github.com/RoboCup-SSL/ssl-refbox.git
sudo apt-get install -y qtcreator

# Sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer

# TODO actually run ubuntu-setup
