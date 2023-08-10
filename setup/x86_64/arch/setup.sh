#!/bin/bash

setup_genkey
setup_promptkey

setup_status installing requisite packages
sudo pacman -S ansible git --noconfirm
	
setup_clonerepo

setup_status installing rolr
setup_download_github rolr-x86_64.pkg.tar.zst $ROLR_URL
sudo pacman -U --noconfirm rolr-x86_64.pkg.tar.zst
rm rolr-x86_64.pkg.tar.zst

setup_status assigning roles
rolr add base shell

exec zsh
