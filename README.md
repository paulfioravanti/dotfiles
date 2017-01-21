## dotfiles

Set up for use with [rcm](https://github.com/thoughtbot/rcm).

## Apple Machine Setup

Before setting up a new development environment on a new machine:

- Install [XCode](https://itunes.apple.com/au/app/xcode/id497799835?mt=12)
- Install XCode Command Line Tools (run `$ xcode-select --install`)

## Initial Setup

Generate dotfile directory, excluding (`-x`) files that don't need to be
symlinked to the home directory:

#### `bash`:

```sh
$ rcup -x README.md -x setup.sh -x config.sh -x *:vim:setup.sh -x *:tmux:setup.sh -x *:oh-my-zsh:setup.sh -x ruby -x osx
```

#### `zsh`:

```sh
$ rcup -x README.md -x setup.sh -x config.sh -x \*:vim:setup.sh -x \*:tmux:setup.sh -x \*:oh-my-zsh:setup.sh -x ruby -x osx
```

## Regenerate Dotfiles

```sh
$ rcup
```

Once intial setup has been run, the `.rcrc` config file for `rcup` will have
been created that contains the exclusions, so only `$ rcup` will need to be run
in the future (unless more files to be excluded from being symlinked are added).

## Setup Scripts

```sh
$ git clone https://github.com/paulfioravanti/dotfiles.git ~/.dotfiles
$ source ~/.dotfiles/setup.sh
```

Regenerate config for all apps and libraries under dotfiles:

```sh
$ source ~/.dotfiles/config.sh
```

Or individually (choose relevant script to regenerate config):

```sh
$ source ~/.dotfiles/ruby/rubies.sh
$ source ~/.dotfiles/osx/karabiner/config.sh
$ source ~/.dotfiles/osx/iterm2/config.sh
```
