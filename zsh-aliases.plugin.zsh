#!/usr/bin/env zsh

# According to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

alias -- '+x'='chmod +x'
alias -- '..'='builtin cd ../ && l'
alias -- '...'='builtin cd ../../ && l'
alias -- '....'='builtin cd ../../../ && l'
alias -- '.....'='builtin cd ../../../../ && l'
alias -- '?'='which'

alias -g g='command -p git'
alias ga='g add'
alias gau='ga --update'
alias gc='g commit --signoff'
alias gca='gc --amend --reset-author'
alias gcm='gc --message'
alias gd='g diff'
alias gds='gd --staged'
alias gnuke='g clean -fxd && g reset --hard'
alias gps='g pull'
alias gps='g push'
alias gr='g reset'
alias grs='gr --staged'
alias grv='g remote --verbose'
alias gs='g status'

alias -g l='command -p ls --color'
alias la='l -a'
alias ll='l -l'

alias cfg='builtin cd ${XDG_CONFIG_DIR:-$HOME/.config/} && l'
alias zdd='builtin cd ${ZDOTDIR:-$HOME/.config/zsh} && l'
