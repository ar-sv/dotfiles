# machine specific configs
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/.zshrc.local" && source "${HOME}/.zshrc.local"

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

path+=("$HOME/.rbenv/bin")
eval "$(rbenv init - zsh)"

export EDITOR="nvim"

# Aliases
alias g="git"
alias g-cleanup='git branch | grep -v "main" | xargs git branch -D'
alias grh='git reset --hard && git clean -fd'
alias b="bundle"
alias be="bundle exec"
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
