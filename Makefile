.PHONY: all delete install update help

all: ## Stow all dotfiles
	@echo "Stowing dotfiles..."
	rm -f ~/.zshrc ~/.fzf.zsh
	stow --verbose --target=$(HOME) --restow */

delete: ## Remove all dotfile symlinks
	@echo "Removing dotfiles..."
	stow --verbose --target=$(HOME) --delete */

install: ## Full setup for new machines
	./install.sh

update: ## Pull latest and restow
	git pull
	@$(MAKE) all

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
