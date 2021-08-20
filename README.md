## dotfiles

Set up for use with [rcm][rcm].

## Apple Machine Setup

Before setting up a new development environment on a new machine:

- Install [XCode][xcode]
- Install XCode Command Line Tools (run `$ xcode-select --install`)
- Install [Homebrew][]

Then:

```txt
brew install rcm
git clone git@github.com:paulfioravanti/dotfiles.git ~/.dotfiles
```

## Initial Setup

Generate dotfile directory, excluding (`-x`) files that don't need to be
symlinked to the home directory:

#### `bash`:

```sh
rcup -x README.md -x LICENSE.txt -x setup.sh -x config.sh -x '*:vim:setup.sh' -x '*:tmux:setup.sh' -x '*:oh-my-zsh:setup.sh' -x osx -x keyboards
```

#### `zsh`:

```sh
rcup -x README.md -x LICENSE.txt -x setup.sh -x config.sh -x \*:vim:setup.sh -x \*:tmux:setup.sh -x \*:oh-my-zsh:setup.sh -x osx -x keyboards
```

## Regenerate Dotfiles

```sh
rcup
```

Once initial setup has been run, the `.rcrc` config file for `rcup` will have
been created that contains the exclusions, so only `$ rcup` will need to be run
in the future (unless more files to be excluded from being symlinked are added).

## Setup Scripts

```sh
source ~/.dotfiles/setup.sh
```

Regenerate config for all apps and libraries under dotfiles:

```sh
source ~/.dotfiles/config.sh
```

Or individually (choose relevant script to regenerate config):

```sh
source ~/.dotfiles/osx/homebrew/config.sh
source ~/.dotfiles/osx/iterm2/config.sh
```

## Social

[![Contact][twitter-badge]][twitter-url]<br />
[![Stack Overflow][stackoverflow-badge]][stackoverflow-url]

[Homebrew]: https://brew.sh/
[rcm]: https://github.com/thoughtbot/rcm
[stackoverflow-badge]: http://stackoverflow.com/users/flair/567863.png
[stackoverflow-url]: http://stackoverflow.com/users/567863/paul-fioravanti
[twitter-badge]: https://img.shields.io/badge/contact-%40paulfioravanti-blue.svg
[twitter-url]: https://twitter.com/paulfioravanti
[xcode]: https://itunes.apple.com/au/app/xcode/id497799835?mt=12
