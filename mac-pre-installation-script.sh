#!/bin/bash

# This is a set-up script with the initial setup. It will install brew and then install ansible. The rest of the setup will ocurr in the ansible script.

# install xcode
xcode-select --install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update && brew upgrade

# instaall ansible
brew install ansible

# make python == python3
alias python='$(whence python3)'
alias pip='$(whence pip3)'

# show ansible version
brew ls --versions ansible
