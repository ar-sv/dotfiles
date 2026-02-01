# machine specific configs
[ -f ~/.zshrc.local ] && source "${HOME}/.zshrc.local"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# evals
eval "$(mise activate zsh)"
export EDITOR="nvim"

bindkey -v

# Aliases
alias bake="bundle exec rake"
alias be="bundle exec"
alias g="git"
alias g-cleanup='git branch | grep -v "main" | xargs git branch -D'
alias grh='git reset --hard && git clean -fd'
alias vi="nvim"
alias cat="bat"
alias th="trash"

# Functions
wip() {
  if [ -z "$1" ]
  then
    g acnv "WIP" --no-verify
  else
    g asnv $1 "WIP" --no-verify
  fi
}

eval "$(starship init zsh)"
