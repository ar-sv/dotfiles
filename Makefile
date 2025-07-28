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
	brew install neovim stow ripgrep bat git-delta wget fzf starship gpg bottom dust fd watch htop mise inetutils
	brew install --cask font-jetbrains-mono-nerd-font
	$(BREW_PREFIX)/opt/fzf/install --all
	rm -rf ~/.config//nvim
	git clone https://github.com/LazyVim/starter ~/.config/nvim
