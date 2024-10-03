#!/bin/bash
## new system init script

export DOTFILES_REPO=git@github.com:thorio/dotfiles.git
export SCRIPTS_URL=https://thorio.github.io/setup
export ROLR_URL=https://api.github.com/repos/thorio/rolr/releases/latest

if bash <(curl $SCRIPTS_URL/run.sh); then
	exec zsh
else
	echo something went wrong
fi
