export PS1="> "

export CLICOLOR=1

# Set the EDITOR after we set the PATH, in case of a locally compiled vim
export EDITOR=`which vim`

#########
# Aliases
#########

# ls
alias l='ls -G'
alias la='ls -lhaG'
alias ll='ls -lhG'

# git
alias g='git'
alias ga='git add'
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

# vim
alias vi='vim'
