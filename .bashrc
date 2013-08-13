export PATH=$HOME/.emacs.d/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PS1="\[\033[33m\]\w \[\e[00m\]\$ "
export PS2="\[\033[33m\]>\[\e[00m\] "
export TERM="xterm-256color"

# History
export HISTCONTROL=ignoredups
export HISTIGNORE="cd*"
export HISTSIZE=2000

# Aliases
alias emacs="env TERM=xterm-256color emacs -nw"
alias imgsize="sips --getProperty pixelHeight --getProperty pixelWidth"
alias ghcm="ghc --make"
alias notice="terminal-notifier -message \"success\" || terminal-notifier -message \"failure\""
function ehgm() { command ehgm.pl $@ && notice ; }

# Basic commands with options
alias ls="ls -alpvG"
alias rm="rm -i"
alias sudo="sudo "
alias rsync="rsync --exclude-from ~/.rsyncignore"

## cabal
export PATH=$HOME/.cabal/bin:$PATH

## npm
export PATH=/usr/local/share/npm/bin:$PATH

## pythonbrew
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
