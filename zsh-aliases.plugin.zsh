#!/usr/bin/env zsh

# According to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

emulate -L zsh

alias -- '+x'='chmod +x'
alias -- '..'='builtin cd ../ && l'
alias -- '...'='builtin cd ../../ && l'
alias -- '....'='builtin cd ../../../ && l'
alias -- '.....'='builtin cd ../../../../ && l'
alias -- '?'='which'
alias b='cd -'
alias rmr='rm -rf'

alias -g B='brew'
alias -g C='cat'
alias -g D='docker'
alias -g G='grep -R'
alias -g L='less'
alias -g P='builtin print'

alias get-path='print -l $path[@]'
alias get-sys='print -l "OSTYPE=${OSTYPE}" "VENDOR=$VENDOR" "MACHTYPE=${MACHTYPE}" "CPUTYPE=${CPUTYPE}" "hardware=$(uname -m)" "processor=$(uname -p)"'
alias get-user='print -P "%F{blue}$(whoami)%f @ %F{cyan}$(uname -a)%f"'

alias mk='make'
alias mkcd='{ local DIR_NAME="$(cat -)"; command mkdir -p -- "$DIR_NAME" && builtin cd -P -- $DIR_NAME }<<<'

alias scratchpad='${EDITOR:-vim} $(mktemp -t scratch.XXX.md)'
alias rsync='rsync -azP'

alias -g g='\git'
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
alias git-repo-website='open $(g remote get-url origin)'

alias -g l='command -p ls --color'
alias la='l -a'
alias ll='l -l'

alias cfg='builtin cd ${XDG_CONFIG_DIR:-$HOME/.config/} && l'
alias ezc='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'
alias zdd='builtin cd ${ZDOTDIR:-$HOME/.config/zsh} && l'
alias zrld='builtin exec zsh'
