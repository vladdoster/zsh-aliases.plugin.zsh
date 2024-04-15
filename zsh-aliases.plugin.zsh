#!/usr/bin/env zsh
# vim: set expandtab filetype=zsh shiftwidth=4 softtabstop=4 tabstop=4:

# According to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}
0=${${(M)0:#/*}:-$PWD/$0}

emulate -LR zsh
setopt no_aliases

alias -- '+x'='command chmod +x'
alias -- '..'='builtin cd -- ../ && l'
alias -- '...'='builtin cd -- ../../ && l'
alias -- '....'='builtin cd -- ../../../ && l'
alias -- '.....'='builtin cd -- ../../../../ && l'
alias -- '?'='command which'
alias b='builtin cd -'
alias rmr='command rm -rf --'

alias -g -- B='command brew'
alias -g -- C='command cat'
alias -g -- D='command docker'
alias -g -- G='command grep -R'
alias -g -- L='command less'
alias -g -- P='builtin print -P'
alias -g -- g='command git'

alias mk='command make'
alias mkcd='{ local DIR_NAME=$(cat -) && command mkdir -p -- $DIR_NAME && builtin cd -P -- $DIR_NAME }<<<'

alias scratchpad='${EDITOR:-vim} $(mktemp -t scratch.XXX.md)'
alias rsync='rsync -azP'

alias -- git-repo-website='open $(git remote get-url origin)'

alias -- l='builtin ls --color'
alias -- la='builtin ls -a'
alias -- ll='builtin ls -l'

alias -- cfg='builtin cd ${XDG_CONFIG_DIR:-$HOME/.config/} && l'
alias -- ezc='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'
alias -- zdd='builtin cd ${ZDOTDIR:-$HOME/.config/zsh} && l'
alias -- zrld='builtin exec ${SHELL:-zsh} -l'

alias -- get-path='print -l -- ${path[@]}'
alias -- get-sys='print -l -- OSTYPE=${(qq)OSTYPE} VENDOR=${(qq)VENDOR} MACHTYPE=${(qq)MACHTYPE} CPUTYPE=${(qq)CPUTYPE} hardware=${(qq)$(uname -m)} processor=${(qq)$(uname -p)}'
alias -- get-user='print -P -- %F{blue}$(whoami)%f @ %F{cyan}$(uname -a)%f'
