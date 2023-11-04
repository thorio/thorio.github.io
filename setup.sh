#!/bin/bash
## new system init script
set -euo pipefail

DOTFILES_REPO=git@github.com:thorio/dotfiles.git
SCRIPTS_URL=https://thorio.github.io/setup
ROLR_URL=https://api.github.com/repos/thorio/rolr/releases/latest

setup_status() {
	printf "\n###\n### $*\n###\n\n"
}

setup_reqcommand() {
	if command -v $1 &> /dev/null; then return; fi

	setup_status $1 not found
	exit 1
}

setup_reqcommand sudo
setup_reqcommand curl

if [ -f "/os-release" ]; then
    setup_status /os-release not found
	exit 1
fi

. /etc/os-release
distro=$ID
arch=$(uname -m)
script_url=$SCRIPTS_URL/$arch/$distro.sh

http_status=$(curl -o /dev/null --silent --head --write-out '%{http_code}' "$script_url")
if [ "$http_status" != "200" ]; then
	setup_status distro+arch not supported
	exit 1
fi

. <(curl $SCRIPTS_URL/common.sh)
. <(curl $script_url)

status EOF reached, something went wrong
exit 1
