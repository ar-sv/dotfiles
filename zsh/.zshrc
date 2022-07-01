eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"


# Aliases
alias g="git"
alias b="bundle"

if [ -r ~/.zshrc-$HOST ]; then
  source ~/.zshrc-$HOST
fi
