.PHONY: all
all:
	stow --verbose --target=$$HOME --restow */

.PHONY: delete
delete:
	stow --verbose --target=$$HOME --delete */

.PHONY: install_deps
install_deps: 
	brew install stow ripgrep bat git-delta
	brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
