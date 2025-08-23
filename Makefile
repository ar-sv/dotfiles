BREW_PREFIX=$(shell brew --prefix 2> /dev/null)

.PHONY: all
all:
	rm ~/Library/Application\ Support/Cursor/User/settings.json
	ln -s ~/dev/dotfiles/vscode/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
	stow --verbose --target=$$HOME --restow */

.PHONY: delete
delete:
	stow --verbose --target=$$HOME --delete */

.PHONY: install_deps
install_deps:
	brew install neovim stow ripgrep bat eza git-delta wget fzf starship bottom dust fd watch htop mise inetutils starship
	brew install --cask font-fira-code-nerd-font
	$(BREW_PREFIX)/opt/fzf/install --all
	rm -rf ~/.config//nvim
	git clone https://github.com/LazyVim/starter ~/.config/nvim