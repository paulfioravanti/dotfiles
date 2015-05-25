# Import .bashrc settings
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

[[ -f /Users/paul/.sentinel/current/bin/sentinel ]] && eval "$(/Users/paul/.sentinel/current/bin/sentinel init -)"
