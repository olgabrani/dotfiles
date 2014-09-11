export PATH=/usr/local/smlnj-110.75/bin/:$PATH

# MacPorts Installer addition on 2013-06-10_at_18:21:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# for VM
#export PS1='\[$(tput setaf 2)\]\u@\h\[\033[00m\]:\[$(tput setaf 5)\]\w\[\033[00m\]\[\033[36m\]$(parse_git_branch)\[\033[00m\]\$ '

# for home computer use only
export PS1='\[$(tput setaf 2)\]mac\[\033[00m\]:\[$(tput setaf 5)\]\w\[\033[00m\]\[\033[36m\]$(parse_git_branch)\[\033[00m\]\$ '

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

# Custom bash prompt via kirsle.net/wizards/ps1.html
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\] \$(parse_git_branch) \[$(tput setaf 7)\]\\$ "


source ~/.config/ls_col
alias ls='ls -lh -G'
