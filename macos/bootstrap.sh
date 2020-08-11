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

# http://krypted.com/mac-security/mac-setting-screen-saver-from-the-cli/
echo "Install Aerial Screensaver: https://github.com/JohnCoates/Aerial"
curl -LlJ https://github.com/JohnCoates/Aerial/releases/download/v1.9.2/Aerial.saver.zip -o Aerial.saver.zip
unzip Aerial.saver.zip
open Aerial.saver
echo "any key to continue"
read -r
rm -rf "Aerial*"
echo "Configure lock screen 2 minutes"
defaults -currentHost write com.apple.screensaver idleTime 120

