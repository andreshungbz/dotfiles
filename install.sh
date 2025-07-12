#!/bin/bash
set -e

# Homebrew Package Manager
# https://brew.sh/

# determine macOS/Linux system
if [[ "$OSTYPE" == "darwin"* ]]; then
  BREW_PATH="/opt/homebrew/bin/brew"
else
  BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
fi

# install non-interactively
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add to PATH and evaluate
echo "eval \"\$($BREW_PATH shellenv)\"" >> ~/.bashrc
echo "eval \"\$($BREW_PATH shellenv)\"" >> ~/.zshrc
eval "$($BREW_PATH shellenv)"

# install packages from list
brew bundle --file ./packages/Brewfile