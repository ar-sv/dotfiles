#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Xcode Command Line Tools (if needed)..."
if ! xcode-select -p &> /dev/null; then
  xcode-select --install
  echo "Please complete the Xcode CLI tools installation, then re-run this script."
  exit 1
fi

echo "==> Installing Homebrew (if needed)..."
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Installing dependencies..."
brew bundle --file=Brewfile

echo "==> Setting up dotfiles..."
make

echo "==> Setting up FZF..."
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

echo "==> Configuring iTerm2..."
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$SCRIPT_DIR/apps/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

echo ""
echo "Done! Next steps:"
echo "  1. Create ~/.gitconfig.local with your name/email"
echo "  2. Create ~/.zshrc.local for machine-specific config"
echo "  3. Restart your terminal"
