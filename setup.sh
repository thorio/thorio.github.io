#!/bin/bash
## new system init script

DOTFILES_REPO=git@github.com:thorio/dotfiles.git

status() {
	printf "\n###\n### $*\n###\n\n"
}

role() {
	ansible-playbook --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 ~/.config/ansible/playbooks/$1.yml -K
}

# generate ssh keys
if [ ! -f ~/.ssh/id_rsa ]; then
	status generating ssh keys
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
fi

# prompt to add deploy key
status printing public key
cat ~/.ssh/id_rsa.pub
printf "\nadd deploy key now\n"
read -n 1 -rsp $'press any key to continue...\n'

# install dependencies
status installing requisite packages
sudo apt-get install ansible git -y

# clone dotfiles repo
if [ ! -d "~/.dotfiles.git" ]; then
	status cloning dotfiles repo
	git clone --bare $DOTFILES_REPO $HOME/.dotfiles.git
	git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME checkout
fi

# assign roles via ansible playbooks
status assigning roles
role personal-repo
role shell

exec zsh
