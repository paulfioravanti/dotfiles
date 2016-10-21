## dotfiles

Set up for use with [rcm](https://github.com/thoughtbot/rcm).

## Initial Setup

Generate dotfile directory, excluding (`-x`) files that don't need to be
symlinked to the home directory:

#### `bash`:

    $ rcup -x README.md -x setup.sh -x config.sh -x *:vim:vim.sh -x *:tmux:tmux.sh -x *:oh-my-zsh:oh-my-zsh.sh -x ruby -x osx

#### `zsh`:

    $ rcup -x README.md -x setup.sh -x config.sh -x \*:vim:vim.sh -x \*:tmux:tmux.sh -x \*:oh-my-zsh:oh-my-zsh.sh -x ruby -x osx

## Regenerate Dotfiles

    $ rcup

Once intial setup has been run, the `.rcrc` config file for `rcup` will have
been created that contains the exclusions, so only `$ rcup` will need to be run
in the future (unless more files to be excluded from being symlinked are added).

## Setup Scripts

Before setting up a new development environment on a new machine,
ensure XCode _and_ XCode command line tools have been installed from the
App Store, then run:

```
$ git clone https://github.com/paulfioravanti/dotfiles.git ~/.dotfiles
$ source ~/.dotfiles/setup.sh
```

Regenerate config for all apps and libraries under dotfiles:

`$ source ~/.dotfiles/config.sh`

Or individually (choose relevant script to regenerate config):

```
$ source ~/.dotfiles/ruby/rubies.sh
$ source ~/.dotfiles/osx/brew/brews.sh
$ source ~/.dotfiles/osx/karabiner/config.sh
$ source ~/.dotfiles/osx/iterm2/config.sh
```
