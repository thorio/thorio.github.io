#!/bin/bash
## new system init script
set -e

setup_status() {
	printf "\n###\n### $*\n###\n\n"
}

setup_reqcommand() {
	if command -v $1 &> /dev/null; then return 0; fi

	setup_status $1 not found
	exit 1
}

setup_reqcommand sudo
setup_reqcommand curl
setup_reqcommand ssh-keygen

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
