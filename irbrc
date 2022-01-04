IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 100000
# NOTE: Using multiline borks steno
IRB.conf[:USE_MULTILINE] = false
IRB.conf[:USE_AUTOCOMPLETE] = false
require "awesome_print"
AwesomePrint.irb!
