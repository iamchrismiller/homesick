#!/usr/bin/env bash

# Load RVM into a shell session
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Load NVM into a shell session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add ruby vendor bin directory to path
export PATH=$PATH:/srv/vendor/ruby/bin:$HOME/bin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='modern'
export SCM_GIT_SHOW_DETAILS=true

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.<org>'

# Set my editor and git editor
export EDITOR="/usr/bin/vi -u NONE"
export GIT_EDITOR='/usr/bin/vi -u NONE'

# Don't check mail when opening terminal.
unset MAILCHECK

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Load Bash It
source $BASH_IT/bash_it.sh

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Chef development kit
eval "$(chef shell-init bash)"

alias gstatus='find . -type d -name ".git" | while read dir ; do sh -c "cd $dir/../ && echo \"\nGIT STATUS IN DIR: ${dir//\.git/}\" && git status -s" ; done'
