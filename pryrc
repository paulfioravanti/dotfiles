# NOTE: Look for the awesome_print gem without it being an
# application dependency.  More info:
# https://github.com/awesome-print/awesome_print/issues/136#issuecomment-89222654
$LOAD_PATH << %x`gem which awesome_print`.chomp("awesome_print.rb\n")
require "awesome_print"
AwesomePrint.pry!

Pry.config.editor = 'vim'

# Hit enter to repeat last command
Pry::Commands.command(/^$/, 'repeat last command') do
  _pry_.run_command Pry.history.to_a.last
end

if defined?(PryByebug)
  Pry.commands.alias_command('c', 'continue')
  Pry.commands.alias_command('s', 'step')
  Pry.commands.alias_command('n', 'next')
  Pry.commands.alias_command('f', 'finish')
end
