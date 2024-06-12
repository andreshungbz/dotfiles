# dotfiles

This dotfiles repository contains a number of configurations files and setup for Linux, MacOS, and Windows (mainly the former two) that can be replicated easily. On new Unix systems the `install.sh` script is used to automate setup. Dotfile management is done using `stow` and `git`.

The following main programs are installed with additional packages being installed with Homebrew:

- [Homebrew](https://brew.sh/)
- [Starship Prompt](https://starship.rs/)
- [Node Version Manager](https://github.com/nvm-sh/nvm)

Configuration files are set for the following:

- `bash`
- `git`
- `nvim`
- `psql`
- `starship`
- `vim`
- `zsh`

Common user binary files are also included in the `~/bin` directory. Wakatime is also configured for `bash` and `zsh` tracking.

## Requirements

[`git`](https://git-scm.com/) and [`curl`](https://curl.se/docs/manpage.html)

## New Installation

First, clone the repository in your home directory:

```
$ cd ~
$ git clone https://github.com/andreshungbz/dotfiles.git
```

Next, enter the dotfiles repository and give execute permissions to `install.sh`:

```
$ cd dotfiles
$ chmod u+x install.sh"
```

Finally, run the installation script. This will overwrite the existing configuration files in the home directory that corresponds with the dotfiles in this repository. Enter through the prompts and lastly the wakatime API key.

```
./install.sh
```

## Updates and Management

Use the `stowpull` alias to pull changes from this repository and update any existing configurations. To add a new configuration file to track, create a corresponding directory and equivalent file in `dotfiles` and run `stow --adopt <package>` where `<package>` corresponds to the new directory. Afterwards commits and pushes can be made with `git`.
