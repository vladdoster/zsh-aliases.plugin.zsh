#!/usr/bin/env zsh
# vim: set expandtab filetype=zsh shiftwidth=4 softtabstop=4 tabstop=4:

# According to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}
0=${${(M)0:#/*}:-$PWD/$0}

# Wrapped in an anonymous function so `emulate -L` / `setopt no_aliases` are
# restored on return. At the top level of a sourced file they would leak into
# the interactive shell and disable alias expansion everywhere.
() {
    emulate -L zsh
    setopt no_aliases

    # ${commands} lives in zsh/parameter; without it every ${commands[x]} lookup is
    # empty and the eza/ls probing below silently picks the fallback forever.
    zmodload -F zsh/parameter p:commands

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
    alias mkcd='() { command mkdir -p -- "$1" && builtin cd -P -- "$1" }'

    # `mktemp -t` means different things on BSD and GNU, and neither accepts a
    # `.md` suffix reliably; ${(%):-%D} is prompt expansion, so no subprocess.
    alias scratchpad='${EDITOR:-vim} ${TMPDIR:-/tmp}/scratch-${(%):-%D}-$RANDOM.md'
    alias rsync='command rsync -azP'

    alias -- git-repo-website='() { local u=${$(command git remote get-url origin)%.git}; [[ $u == git@* ]] && u=https://${${u#git@}/://}; ${commands[open]:-xdg-open} $u }'

    # ${commands[eza]} is the absolute path to eza, or empty when it is not on
    # $PATH, so `:-ls` falls back at run time. `--color=auto` is the only spelling
    # both eza and ls accept, and it keeps escape codes out of pipes.
    #
    # ${=...:+...} carries the eza-only flags, which ls would reject. The `=` is
    # load-bearing: zsh does not word-split the result of a parameter expansion,
    # so without it the flags would reach eza as one argument.
    alias -- l='${commands[eza]:-ls} --color=auto ${=commands[eza]:+--group-directories-first}'
    alias -- la='${commands[eza]:-ls} --color=auto ${=commands[eza]:+--group-directories-first} -a'
    alias -- ll='${commands[eza]:-ls} --color=auto ${=commands[eza]:+--group-directories-first --git} -l'
    alias -- lr='${commands[eza]:-ls} --color=auto ${=commands[eza]:+--group-directories-first --git} -lR'

    alias -- cfg='builtin cd ${XDG_CONFIG_HOME:-$HOME/.config} && l'
    alias -- ezc='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'
    alias -- zdd='builtin cd ${ZDOTDIR:-$HOME/.config/zsh} && l'
    alias -- zrld='builtin exec ${SHELL:-zsh} -li'

    alias -- get-path='print -l -- $path'
    alias -- get-sys='print -l -- OSTYPE=${(qq)OSTYPE} VENDOR=${(qq)VENDOR} MACHTYPE=${(qq)MACHTYPE} CPUTYPE=${(qq)CPUTYPE} hardware=${(qq)$(uname -m)} processor=${(qq)$(uname -p)}'
    alias -- get-user='print -P -- %F{blue}$(whoami)%f @ %F{cyan}$(uname -a)%f'
}
