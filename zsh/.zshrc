eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

path+=("$HOME/.rbenv/bin")
eval "$(rbenv init - zsh)"

export EDITOR="nvim"

# Aliases
alias g="git"
alias g-cleanup='git branch | grep -v "main" | xargs git branch -D'
alias b="bundle"
alias v="nvim"

# Functions
wip() {
  if [ -z "$1" ]
  then
    g ac "WIP"
  else
    g as $1 "WIP"
  fi
}

if [ -r ~/.zshrc-$HOST ]; then
  source ~/.zshrc-$HOST
fi