### dotfiles

Set up for use with [rcm](https://github.com/thoughtbot/rcm).

Regenerate dotfile directory:

`$ rcup -x README.md -x setup.sh -x config.sh -x *:vim:vim.sh -x *:tmux:tmux.sh -x ruby -x osx`

Once this has been run, the `.rcrc` config file for `rcup` will have been
created that contains the exclusions, so only `$ rcup` will need to be run in
the future.

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
