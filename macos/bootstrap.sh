#!/usr/bin/env bash
set -eu -o pipefail
set -x

xcode-select --install
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
sudo easy_install pip
sudo pip install pip --upgrade
sudo pip install ansible==2.7.5
ansible-galaxy install --role-file requirements.yml --roles-path roles
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew install readline xz
# curl https://pyenv.run | bash
# cp dot-bashrc "${HOME}/.bashrc"
# . "${HOME}/.bashrc"
# pyenv install 2.7.15
# CFLAGS="-I$(brew --prefix openssl)/include" \
# LDFLAGS="-L$(brew --prefix openssl)/lib" \
# pyenv install -v 3.7.1

# mkdir "${HOME}/.ssh"
# ln -s "${HOME}/Dropbox/profiles/dot-ssh" "${HOME}/dot-ssh"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh)"
# rm -rf "${HOME}/.zsh.after" "${HOME}/.zsh.before" "${HOME}/.zsh.prompts"
# ln -s "${HOME}/Dropbox/profiles/osx/.zsh.after" "${HOME}/"
# ln -s "${HOME}/Dropbox/profiles/osx/.zsh.before" "${HOME}/"
# ln -s "${HOME}/Dropbox/profiles/osx/.zsh.prompts" "${HOME}/"
# pushd .yadr
#   git checkout petemounce
# popd


# http://krypted.com/mac-security/mac-setting-screen-saver-from-the-cli/
echo "Install Aerial Screensaver: https://github.com/JohnCoates/Aerial"
echo "Configure screensaver"
echo "Configure lock screen 2 minutes"
defaults -currentHost write com.apple.screensaver idleTime 120

# sync sublime text packages via dropbox
# https://packagecontrol.io/docs/syncing#dropbox-windows
pushd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
	rm -r User
	ln -s ~/Dropbox/Sublime/User
popd
