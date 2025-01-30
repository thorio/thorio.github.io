setup_genkey
setup_promptkey

setup_status installing requisite packages
sudo apt-get install ansible git -y
setup_clonerepo

setup_status installing rolr
package=rolr-$arch.deb

setup_download_github $package $ROLR_URL
sudo dpkg -i $package
rm $package

setup_status assigning roles
rolr add personal-repo shell
