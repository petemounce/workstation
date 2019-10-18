#!/usr/bin/env bash
set -eu -o pipefail
set -x

xcode-select --install || echo "xcode-select has been installed already, probably."
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
sudo easy_install pip
sudo pip install pip --upgrade
sudo pip install ansible==2.8.6
ansible-galaxy install --role-file requirements.yml --roles-path roles


# http://krypted.com/mac-security/mac-setting-screen-saver-from-the-cli/
echo "Install Aerial Screensaver: https://github.com/JohnCoates/Aerial"
curl -LlJ https://github.com/JohnCoates/Aerial/releases/download/v1.6.2/Aerial.saver.zip -o Aerial.saver.zip
unzip Aerial.saver.zip
open Aerial.saver
echo "any key to continue"
read -r
rm -rf "Aerial*"
echo "Configure lock screen 2 minutes"
defaults -currentHost write com.apple.screensaver idleTime 120

# sync sublime text packages via dropbox
# https://packagecontrol.io/docs/syncing#dropbox-windows
pushd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
	rm -r User
	ln -s ~/Dropbox/Sublime/User
popd
