IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 100000
IRB.conf[:USE_AUTOCOMPLETE] = false
# NOTE: Using multiline borks steno
IRB.conf[:USE_MULTILINE] = false
IRB.conf[:USE_READLINE] = true
require "awesome_print"
AwesomePrint.irb!
