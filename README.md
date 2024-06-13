# dotfiles

This dotfiles repository contains a number of configurations files, package lists and executable binaries that can easily and quickly replicated on systems. Dotfile management is done using `stow` and `git`.

Each visible directory corresponds to a package installed by `stow` that mirrors the structure from the home directory. The `.etc` directory contains extra files necessary for other files, such as common `bash` and `zsh` configurations and aliases. It also contains a `packages` directory that contains package lists for package managers for quick installation.

Custom binary files are located in the `bin` directory.

On new systems of Linux and MacOS, the `install.sh` script automates installation with the minimal set of packages via Homebrew. Wakatime is also configured for `bash` and `zsh` tracking.

## Requirements

[`git`](https://git-scm.com/) and [`curl`](https://curl.se/docs/manpage.html)

## Installation

First, clone the repository into the home directory:

```
$ cd ~
$ git clone https://github.com/andreshungbz/dotfiles.git
```

Next, enter the dotfiles repository and give execute permissions to `install.sh`:

```
$ cd dotfiles
$ chmod u+x install.sh"
```

Finally, run the installation script. This will overwrite the existing configuration files in the home directory that corresponds with the dotfiles in this repository. The Wakatime API is prompted at the end.

```
$ ./install.sh
```

## After Installing

After the installation script is done. Restart the terminal and change the font as necessary.

A full restoration of a backup can be done with the corresponding package list located in `~/dotfiles/.etc/packages`. For example, on Linux systems, run the following command:

```
$ brew bundle --file=~/dotfiles/.etc/packages/homebrew/linux-backup
```

New binary files can quickly be made to be executable by running the following alias command:

```
$ binex
```

## Managing Dotfiles

Use the `stowpull` alias to pull changes from this repository and update any existing configurations. This is an alias for:

```
$ git --git-dir=$HOME/dotfiles/.git pull
$ cd ~/dotfiles && stow */
```

To adopt a new configuration to track, create a corresponding directory and equivalent file structure in `dotfiles` directory and run `stow --adopt <package>` where `<package>` corresponds to the new directory.

To create a new configuration copied to the home directory, create a corresponding directory and equivalent file structure in `dotfiles` directory and run `stow <package>` where `<package>` corresponds to the new directory.

Quickly stow all packages with the command:

```
$ stow */
```

If a configuration file already exists that conflicts with an existing file in the repository, it can quickly be replaced with the following command:

```
$ stow --adopt */ && git restore .
```
