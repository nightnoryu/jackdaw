# --------------------
# General
# --------------------

if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting
end

set -gx EDITOR nvim
set -gx MANPAGER 'nvim +Man!'

fish_add_path $HOME/.config/scripts
fish_add_path $HOME/.local/bin
fish_add_path $HOME/go/bin

set -gx HOMEBREW_NO_ENV_HINTS 1
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

# --------------------
# Aliases
# --------------------

alias vim="nvim"
alias cat="bat"
alias ll="ls -lsah"

alias ssh="kitty +kitten ssh"
alias s="ssh-fzf"

alias dc="docker compose"
alias m="mise"

alias g="git"
alias gs="git status --short"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gl="git log --graph --color=always"
alias gco="git checkout"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gf="git fetch"
alias gu="git pull"
function gltl --wraps git --description 'alias gtl=git log <last tag>..HEAD --oneline'
  git log $(git describe --tags --abbrev=0)..HEAD --oneline
end
