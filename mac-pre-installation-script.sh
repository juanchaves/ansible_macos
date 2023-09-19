#!/bin/bash

# This is a set-up script with the initial setup. It will install brew and then install ansible. The rest of the setup will ocurr in the ansible script.

# install xcode
xcode-select --install

# install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update && brew upgrade

# install ansible
brew install ansible

# install python using rtx
brew install rtx
rtx --version
# TODO: catch error / handle exception if rtx not properly installed
cat << 'EOF'  >> ~/.zshrc
eval "$(~/bin/rtx activate zsh)"
EOF

# make python == python3
alias python='$(whence python3)'
alias pip='$(whence pip3)'

# show ansible version
brew ls --versions ansible
