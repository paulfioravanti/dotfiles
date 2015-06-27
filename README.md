### dotfiles

Set up for use with [rcm](https://github.com/thoughtbot/rcm).

Regenerate dotfile directory:

`$ rcup -x README.md -x setup.sh -x *:ruby -x *:osx`

Once this has been run, the `.rcrc` config file for `rcup` will have been
created that contains the exclusions, so only `$ rcup` will need to be run in
the future.

Before setting up a new development environment on a new machine,
ensure XCode and XCode command line tools have been installed from the
App Store, then run:

```
$ git clone https://github.com/paulfioravanti/dotfiles.git ~/.dotfiles
$ source ~/.dotfiles/setup.sh
```
Regenerate the Ruby versions list:

`$ source ~/.dotfiles/ruby/rubies.sh`

Regenerate the lists for brew (taps, packages, casks):

`$ source ~/.dotfiles/osx/brew/brews.sh`

Regenerate the Karabiner config:

`$ source ~/.dotfiles/osx/karabiner/config.sh`

