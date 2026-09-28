# --------------------
# General
# --------------------

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

alias vim="nvim"
alias cat="bat"
alias ssh="kitty +kitten ssh"
alias s="ssh-fzf"

set -gx EDITOR nvim
set -gx MANPAGER 'nvim +Man!'
set PATH $PATH $HOME/.config/scripts

# --------------------
# Dev tools
# --------------------

## Go

set -gx GOROOT "/home/linuxbrew/.linuxbrew/opt/go/libexec"
set -gx GOPATH "$HOME/go"
set -gx GOPRIVATE "*.ispring.lan"
set PATH $PATH $HOME/go/bin

## Brew

set -gx HOMEBREW_NO_ENV_HINTS 1
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

## Git

alias g="git"

alias gs="git status --short"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gl="git log  --graph"

alias ga="git add"
alias gc="git commit"
alias gco="git checkout"

alias gp="git push"
alias gu="git pull"
