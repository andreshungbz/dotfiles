#!/bin/bash

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# prompt for complete or minimum installation for brewfile
read -p "Complete or minimal installation? [C/m]: " choice

# make the choice case-insensitive
choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

# detect linux or macOS
os_name=$(uname -s)

# run the brew bundle command to install applications

# on linux systems
if [ "$os_name" == "Linux" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  if [[ "$choice" == 'c' ]]; then
    brew bundle --file ./homebrew/linux-brewfile
  else
    brew bundle --file ./homebrew/linux-brewfile-min
  fi
fi

# on macOS systems
if [ "$os_name" == "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  if [[ "$choice" == 'c' ]]; then
    brew bundle --file ./homebrew/macos-brewfile
  else
    brew bundle --file ./homebrew/macos-brewfile-min
  fi
fi

# run git stow

read -p "Run stow on all packages? [Y/n]: " choice

# make the choice case-insensitive
choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

# on linux systems
if [ "$os_name" == "Linux" ]; then
  if [[ "$choice" == 'y' || "$choice" == '' ]]; then
    stow --adopt */ && git restore .
  fi
fi

# on macOS systems
if [ "$os_name" == "Darwin" ]; then
  if [[ "$choice" == 'y' || "$choice" == '' ]]; then
    stow --adopt */ && git restore .
  fi
fi

# link wakatime-cli to homebrew package for zsh
mkdir ~/.wakatime && ln -s $(which wakatime-cli) ~/.wakatime/wakatime-cli 

# add execute permissions to bin files
source ./functions.sh
exec_to_owner "~/bin"