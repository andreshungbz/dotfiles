#!/bin/bash

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# run the brew bundle command to install minimum packages

# detect linux or macOS
os_name=$(uname -s)

# on linux systems
if [ "$os_name" == "Linux" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  brew bundle --file ./.etc/packages/homebrew/linux-minimum
fi

# on macOS systems
if [ "$os_name" == "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew bundle --file ./.etc/packages/homebrew/macos-minimum
fi

# run git stow
stow --adopt */ && git restore .

# wakatime setup
read -p "Enter wakatime API key: " wakatime_api_key
rm -f ~/.wakatime.cfg
touch ~/.wakatime.cfg
echo "[settings]" > ~/.wakatime.cfg
echo "api_key=$wakatime_api_key" >> ~/.wakatime.cfg
# link wakatime-cli to homebrew package for zsh
rm -f ~/.wakatime/wakatime-cli
mkdir -p ~/.wakatime && ln -s $(which wakatime-cli) ~/.wakatime/wakatime-cli 

# add execute permissions to bin files
source ./.etc/functions.sh
exec_to_owner "~/bin"