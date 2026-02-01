# Dotfiles

Shared development environment for macOS.

## Setup

```bash
git clone git@github.com:yourorg/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
./install.sh
```

This installs Xcode CLI tools, Homebrew, all dependencies, and symlinks config files.

## What's Included

| Category | Tools |
|----------|-------|
| Shell | Zsh, Starship prompt, FZF fuzzy finder |
| Git | Delta diffs, sensible defaults, aliases |
| Editors | VS Code, Neovim |
| Terminal | iTerm2, Fira Code Nerd Font |
| CLI | ripgrep, bat, eza, fd, jq, tree, htop |
| Runtime | mise (manage Node, Python, etc.) |

## Personal Config

These files are gitignored and won't be committed:

| File | Purpose |
|------|---------|
| `~/.gitconfig.local` | Your name, email, signing key |
| `~/.zshrc.local` | Machine-specific PATH, aliases, secrets |

Copy templates from `examples/` to get started:

```bash
cp examples/gitconfig.local.example ~/.gitconfig.local
cp examples/zshrc.local.example ~/.zshrc.local
```

## Post-Install

1. **iTerm2**: Preferences > General > Settings > Load from `~/dev/dotfiles/iterm2`
2. **Font**: Set iTerm2/VS Code font to "FiraCode Nerd Font"
3. **Restart terminal** to load all changes

## Commands

```bash
make help     # Show available commands
make          # Re-stow dotfiles after changes
make deps     # Install Brewfile packages
make update   # Pull latest and restow
make delete   # Remove all symlinks
make install  # Full setup (runs install.sh)
```

## Updating

```bash
cd ~/dev/dotfiles
make update
```

## Structure

```
dotfiles/
├── git/           # .gitconfig
├── zsh/           # .zshrc
├── fzf/           # FZF config
├── starship/      # Prompt config
├── vscode/        # VS Code settings
├── iterm2/        # iTerm2 preferences
├── examples/      # Templates for local config
├── Brewfile       # Homebrew dependencies
└── install.sh     # Bootstrap script
```

Each folder is a [stow](https://www.gnu.org/software/stow/) package. Files inside get symlinked to `$HOME`.
