# --------------------
# General
# --------------------

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

set -gx EDITOR nvim
set -gx MANPAGER 'nvim +Man!'
set PATH $PATH $HOME/.config/scripts

# --------------------
# Dev tools
# --------------------

## Brew

set -gx HOMEBREW_NO_ENV_HINTS 1
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

## Go

set -gx GOROOT "/home/linuxbrew/.linuxbrew/opt/go/libexec"
set -gx GOPATH "$HOME/go"
set PATH $PATH $HOME/go/bin

# --------------------
# Aliases
# --------------------

alias vim="nvim"
alias cat="bat"
alias ll="ls -l"

alias ssh="kitty +kitten ssh"
alias s="ssh-fzf"

alias dc="docker compose"
alias m="mise"

alias g="git"
alias gs="git status --short"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gl="git log --oneline --graph --color=always"
alias gco="git checkout"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gf="git fetch"
alias gu="git pull"
function gmm --wraps git --description 'alias gmm=git fetch origin && git merge origin/main'
  git fetch origin
  git merge origin/$(git show-ref -q --heads main && echo main || echo master)
end
function gltl --wraps git --description 'alias gtl=git log <last tag>..HEAD --oneline'
  git log $(git describe --tags --abbrev=0)..HEAD --oneline
end
