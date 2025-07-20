BREW_PREFIX=$(shell brew --prefix 2> /dev/null)

.PHONY: all
all:
	rm ~/Library/Application\ Support/Cursor/User/settings.json
	ln -s ~/dev/dotfiles/vscode/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
	cp -f vscode/extensions.json ~/.vscode/
	stow --verbose --target=$$HOME --restow */

.PHONY: delete
delete:
	stow --verbose --target=$$HOME --delete */

.PHONY: install_deps
install_deps:
	brew install neovim stow ripgrep bat git-delta wget fzf starship gpg bottom dust fd watch htop zsh-autosuggestions zsh-syntax-highlighting mise inetutils
	$(BREW_PREFIX)/opt/fzf/install --all
	brew install --cask font-fira-code-nerd-font
	curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
	rm -rf ~/.config//nvim
	git clone https://github.com/LazyVim/starter ~/.config/nvim
