#!/bin/bash

function setup_genkey() {
	if [ -f ~/.ssh/id_rsa ]; then return; fi

	setup_status generating ssh keys
	ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa -q -N ""
}

function setup_promptkey() {
	setup_status printing public key
	cat ~/.ssh/id_rsa.pub
	printf "\nadd deploy key now\n"
	read -n 1 -rsp $'press any key to continue...\n'
}

function setup_clonerepo() {
	if [ -d "~/.dotfiles.git" ]; then return; fi

	setup_status cloning dotfiles repo
	git clone --bare $DOTFILES_REPO ~/.dotfiles.git
	git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME checkout
}

function setup_download_github() {
	curl $(curl $2 | grep -Po "browser_download_url.*$1" | grep -Po 'http.*') -Lo $1
}
