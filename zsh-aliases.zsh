#!/usr/bin/env zsh

alias -- '+x'='chmod +x'
alias -- '..'='builtin cd ../ && l'
alias -- '...'='builtin cd ../../ && l'
alias -- '....'='builtin cd ../../../ && l'
alias -- '.....'='builtin cd ../../../../ && l'
alias -- '?'='which'

alias -g g='command -p git'
alias gc='g commit --signoff'
alias gca='g --amend --reset-author'
alias gcm='g commit --signoff --message'
alias gd='g diff'
alias gds='gd --staged'
alias gnuke='g clean -fxd && g reset --hard'
alias gr='g reset'
alias grs='gr --staged'
alias gs='g status'

alias -g l='command -p ls --color'
alias la='l -a'
alias ll='l -l'
