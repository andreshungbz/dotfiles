# dotfiles

This is a work-in-progress repository of the dotfiles that I have edited and used so far, mainly on MacOS and Linux. More editing will be done to normalize the configuration files such that they are separated or agnostic operating system and shell-wise.

## dependencies

[`git`](https://git-scm.com/) and [`stow`](https://www.gnu.org/software/stow/)

## install and usage

To copy over and replace all configuration files as necessry:

```
$ git clone https://github.com/andreshungbz/dotfiles.git
$ cd dotfiles
$ stow --adopt */
$ git checkout .
```

To copy over an individual package:

```
$ stow <folder_name>
```
