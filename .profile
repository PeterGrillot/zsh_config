
# User configuration
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Use NVM from .nvmrc
[ -f .nvmrc ] && nvm use > /dev/null

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# -----------------------------------------
#               Aliases
# -----------------------------------------
# To temporarily bypass an alias
# we can type '\whatever'

# Colorful List Files at current location
alias ls='ls -aGp'

# Lazy directory traverse
# up a directory
alias up='cd ../'

# Back to previous directory
alias back='cd -'

# Home directory '~/'
alias home='cd ~'

# Clear
alias cl='clear'

# rm -r 'directory'
function rmf {
  rm -rf $1
}

# -----------------------------------------
#             All things Git
# -----------------------------------------
# Git! shitty spllling
alias gut='git'

# git status
alias gsts='git status'

# git checkout
alias gswb='git checkout'

# git new branch
alias gnwb='git checkout -b'

# git rebase
alias grb='git rebase -i'

# commit
function gac {
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  
  if [ -n "$1" ]; then
    message="$1"
  else
    echo "You are in <${BRANCH}>, Message:"
    read message
  fi

  git add -A && git commit -m "$message"
}

# update from branch
function gmerge {
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  echo "You are in <${BRANCH}>, Merge from from which branch?"
  read message
  git merge --no-ff -m "Update from Develop" $message
}
