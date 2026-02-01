# Dotfiles

Shared development environment for macOS.

## Setup

```bash
git clone git@github.com:yourorg/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
./install.sh
```

After install, copy the example templates for your personal config:

```bash
cp examples/gitconfig.local.example ~/.gitconfig.local  # Your name/email
cp examples/zshrc.local.example ~/.zshrc.local          # Machine-specific config
```

Then: iTerm2 > Preferences > General > Settings > Load from `~/dev/dotfiles/iterm2`

## How it Works

- **[GNU Stow](https://www.gnu.org/software/stow/)** symlinks config files to `$HOME`. Each folder (git/, zsh/, etc.) is a "package" mirroring your home directory structure.
- **Brewfile** declares all dependencies. Homebrew installs them idempotently.
- **Local files** (`~/.gitconfig.local`, `~/.zshrc.local`) let you override settings without committing personal info.

## Commands

```bash
make help     # Show all commands
make          # Re-stow after changes
make deps     # Install new Brewfile packages
make update   # Pull latest and restow
```

## Adding Tools

Edit `Brewfile`, run `make deps`, then commit and push.

## What's Included

| Category | Tools |
|----------|-------|
| Shell | Zsh, Starship prompt, FZF |
| Git | Delta diffs, sensible defaults, aliases |
| Editors | VS Code, Neovim |
| Terminal | iTerm2, Fira Code Nerd Font |
| CLI | ripgrep, bat, eza, fd, jq, tree, htop |
| Runtime | mise (Node, Python, etc.) |
