Just my dotfiles.  Set up for use with [rcm](https://github.com/thoughtbot/rcm).

`$ git clone https://github.com/paulfioravanti/dotfiles.git ~/.dotfiles`

Regenerate the dotfiles:

`$ rcup -x README.md setup.sh *:brew *:ruby`

Once this has been run, the `.rcrc` config file for `rcup` will have been
created that contains the exclusions, so only `$ rcup` will need to be run in
the future.

Set up a new development environment:

`$ source ~/.dotfiles/setup.sh`

Regenerate the lists for brew (taps, packages, casks):

`$ source ~/.dotfiles/brew/brews.sh`

Regenerate the Ruby versions list:

`$ source ~/.dotfiles/ruby/rubies.sh`
