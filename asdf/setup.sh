#!/bin/bash
# Configure asdf and install plugins

# Install all used plugins
asdf plugin add clojure https://github.com/halcyon/asdf-clojure.git
asdf plugin add crystal https://github.com/marciogm/asdf-crystal.git
asdf plugin add deno https://github.com/asdf-community/asdf-deno.git
asdf plugin add dhall https://github.com/aaaaninja/asdf-dhall.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add elm https://github.com/asdf-community/asdf-elm.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add golang https://github.com/kennyp/asdf-golang.git
asdf plugin add gradle https://github.com/rfrancis/asdf-gradle.git
asdf plugin add haskell https://github.com/vic/asdf-haskell.git
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf plugin add julia https://github.com/rkyleg/asdf-julia.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add php https://github.com/asdf-community/asdf-php.git
asdf plugin add python https://github.com/tuvistavie/asdf-python.git
asdf plugin add redis https://github.com/smashedtoatoms/asdf-redis.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add rust https://github.com/code-lever/asdf-rust.git

# Install latest version of each language and set it to be the global default
asdf plugin list | xargs -I lang sh -c "asdf install lang latest && asdf global lang $(asdf latest lang)"

# Import NodeJS release team keyring
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
