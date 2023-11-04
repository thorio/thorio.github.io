#!/bin/bash

setup_genkey
setup_promptkey

setup_status installing requisite packages
sudo pacman -S ansible git --noconfirm
setup_clonerepo

setup_status installing rolr
package=rolr-$arch.pkg.tar.zst

setup_download_github $package $ROLR_URL
sudo pacman -U --noconfirm $package
rm $package

setup_status assigning roles
rolr add base shell

exec zsh
