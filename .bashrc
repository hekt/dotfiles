export PATH=$HOME/.emacs.d/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PS2="> "
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Prompt
source $HOME/.bash/git-completion.bash
source $HOME/.bash/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
# export PS1="\[\033[33m\]\w \[\e[00m\]\$ "
export PS1='\[\033[33m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\n$ '

# History
export HISTCONTROL=ignoredups
export HISTIGNORE="cd*"
export HISTSIZE=2000

# Aliases
alias emacs="env TERM=xterm-256color emacs -nw"
alias imgsize="sips --getProperty pixelHeight --getProperty pixelWidth"
alias g="git"

# Functions
mc() {
    mkdir -p $1 && cd $1
}
notice() {
    local title="Terminal"
    local message="done"
    local error_message="error"
    if [ !$0 = "" ]; then title=$0; fi
    if [ !$1 = "" ]; then message=$1; fi
    if [ !$2 = "" ]; then error_message=$2; fi
    echo "display notification \"$message\" with title \"$title\"" | osascript || echo "display notification \"$error_message\" with title \"$title\"" | osascript
}
ehgm() {
    ehgm.pl $@ && notice "ehgm"
}
timer() {
    perl ~/bin/timer.pl --color=green --scale=1 --time=$(($@*60)) && notice "Timer"
}

# Basic commands with options
alias ls="ls -alpvG"
alias rm="rm -i"
alias sudo="sudo "
alias rsync="rsync --exclude-from ~/.rsyncignore"

## php
export PATH="$HOME/.composer/vendor/bin:$PATH"

## IL
alias hovervg="cd $HOME/Vagrant/hover && vagrant up && ssh hovervm"
alias shukeenvg="cd $HOME/Vagrant/shukeen && vagrant up && ssh shukeen"
alias shukeenfs="cd $HOME && sshfs shukeen:/home/k-horie shukeenvm"
