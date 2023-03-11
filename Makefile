.PHONY: all
all:
	stow --verbose --target=$$HOME --restow */

.PHONY: delete
delete:
	stow --verbose --target=$$HOME --delete */

.PHONY: install_deps
install_deps: 
	brew install stow ripgrep bat git-delta zsh-vi-mode wget fzf
	brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
	brew tap cjbassi/ytop && brew install ytop
	curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
