#!/usr/bin/env bash
set -eu -o pipefail
set -x

ANSIBLE_VERSION="${1:-2.9.11}"
xcode-select --install || echo "xcode-select has been installed already, probably."
#sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.15.pkg -target /
sudo easy_install pip
sudo pip install pip --upgrade
sudo pip install "ansible==${ANSIBLE_VERSION}"
ansible-galaxy install --role-file "requirements.yml" --roles-path "roles-external"
