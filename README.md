Just my dofiles.  Set up for use with [rcm](https://github.com/thoughtbot/rcm).

`$ git clone https://github.com/paulfioravanti/dotfiles.git ~/.dotfiles`

Regenerate the files:

`$ rcup -x README.md *:brew *:ruby`

Once this has been run, the `.rcrc` config file for `rcup` will have been
created that contains the exclusions, so only `$ rcup` will need to be run in
the future.
