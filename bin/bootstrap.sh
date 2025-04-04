#!/bin/zsh

# This is a set-up script with the initial setup. It will install brew and then install ansible. The rest of the setup will occur in the ansible script.

# install xcode
echo "installing Xcode"
xcode-select --install || /usr/sbin/softwareupdate --install -a
/usr/sbin/softwareupdate --install-rosetta

# install homebrew
echo "installing homebrew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  && \

(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/chavesju/.zprofile && \
eval "$(/usr/local/bin/brew shellenv)" && \

brew update && \
brew upgrade && \

# install ansible
brew install ansible && \

brew update && \
brew upgrade && \

# install python using mise (formerly rtx): https://github.com/jdx/mise
brew install mise && \

brew update && \
brew upgrade && \

mise --version && \
# TODO: catch error / handle exception if mise not properly installed
echo 'eval "$(mise activate zsh)"' >> "${ZDOTDIR-$HOME}/.zshrc.personal.after"

# show ansible version
brew ls --versions ansible

ansible-galaxy install -r requirements.yml

ansible-playbook -i inventory.ini -c local ansible_osx.yml --ask-become-pass
