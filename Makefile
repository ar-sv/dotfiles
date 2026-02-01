.PHONY: all deps delete install update help

PACKAGES_DIR := packages

all: ## Stow all dotfiles
	@echo "Cleaning up old symlinks..."
	rm -f ~/.zshrc ~/.fzf.zsh ~/.gitconfig ~/.gemrc ~/.hushlogin
	rm -f ~/.config/starship.toml
	rm -rf ~/.config/git
	@echo "Stowing dotfiles..."
	cd $(PACKAGES_DIR) && stow --verbose --target=$(HOME) --restow */

deps: ## Install Brewfile packages
	brew bundle

delete: ## Remove all dotfile symlinks
	@echo "Removing dotfiles..."
	cd $(PACKAGES_DIR) && stow --verbose --target=$(HOME) --delete */

install: ## Full setup for new machines
	./install.sh

update: ## Pull latest and restow
	git pull
	@$(MAKE) all

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
