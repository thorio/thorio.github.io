#!/bin/bash

setup_genkey
setup_promptkey

setup_status installing requisite packages
sudo apt-get install ansible git -y

setup_clonerepo

setup_status installing rolr
setup_download_github rolr-x86_64.deb $ROLR_URL
sudo dpkg -i rolr-x86_64.deb
rm rolr-x86_64.deb

setup_status assigning roles
rolr add personal-repo shell

exec zsh
