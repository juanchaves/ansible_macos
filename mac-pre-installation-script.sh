#!/bin/bash

# This is a set-up script with the initial setup. It will install brew and then install ansible. The rest of the setup will ocurr in the ansible script.

# install xcode
xcode-select --install

# install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update && brew upgrade

# install ansible
brew install ansible

# install python using mise (formery rtx): https://github.com/jdx/mise 
brew install mise
mise --version
# TODO: catch error / handle exception if mise not properly installed
cat << 'EOF'  >> ~/.zshrc
eval "$(~/bin/mise activate zsh)"
EOF

# make python == python3
alias python='$(whence python3)'
alias pip='$(whence pip3)'

# show ansible version
brew ls --versions ansible
