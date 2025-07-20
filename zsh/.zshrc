# machine specific configs
[ -f ~/.zshrc.local ] && source "${HOME}/.zshrc.local"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$($HOME/.local/bin/mise activate zsh)"

export EDITOR="nvim"
export BAT_THEME="Dracula"

# Aliases
alias g="git"
alias g-cleanup='git branch | grep -v "main" | xargs git branch -D'
alias grh='git reset --hard && git clean -fd'
alias be="bundle exec"
alias bake="bundle exec rake"
alias vi="nvim"
alias cat="bat --style=plain"
alias tm="tmux attach || tmux new"

# Functions
wip() {
  if [ -z "$1" ]
  then
    g acnv "WIP" --no-verify
  else
    g asnv $1 "WIP" --no-verify
  fi
}
