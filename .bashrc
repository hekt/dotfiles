export PATH=/usr/local/bin:$PATH
export PS1="\[\033[33m\]\w \[\033[0m\]\$ "
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

source ~/.pythonbrew/etc/bashrc
source ~/.pythonbrew/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=py2.7.2

alias imgsize="sips --getProperty pixelHeight --getProperty pixelWidth"
alias ghcm="ghc --make"

alias ls="ls -alp"
alias rm="rm -i"
alias sudo="sudo "
