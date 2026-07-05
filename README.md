# Dotfiles

Shared macOS development environment.

## Before You Start

- Use macOS.
- Make sure your GitHub SSH key can clone `git@github.com:ar-sv/dotfiles.git`.
- If the installer opens the Xcode Command Line Tools prompt, finish that install and run `./install.sh` again.

## New Machine Setup

Clone the repo and run the installer:

```bash
git clone git@github.com:ar-sv/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
./install.sh
```

The installer is safe to re-run. It checks Xcode Command Line Tools, installs Homebrew if needed, installs Homebrew packages, links shell/git/editor config, and applies app settings.

## Personal Config

After the installer finishes, create local config files for values that should not be committed:

```bash
cp examples/gitconfig.local.example ~/.gitconfig.local
cp examples/zshrc.local.example ~/.zshrc.local
```

Then edit them:

- `~/.gitconfig.local`: set your Git name, email, and signing key.
- `~/.zshrc.local`: add machine-specific paths, aliases, and environment variables.

Restart your terminal after editing local shell config.

## Common Commands

```bash
./install.sh  # Set up or re-apply this repo
make update   # Pull latest changes and re-run setup
make help     # Show maintenance commands
```

## Updating Tools

Edit `Brewfile`, then run:

```bash
./install.sh
```

Commit and push the Brewfile change after confirming the install works.

## What Gets Configured

- CLI tools and apps from `Brewfile`
- Zsh, Git, Starship, shell defaults, and Neovim via GNU Stow
- fzf shell integration
- iTerm2 preferences
- VS Code and Cursor user settings when those files do not already exist

## How It Works

- `install.sh` is the main onboarding entry point.
- `Brewfile` declares Homebrew dependencies.
- `packages/` contains files that GNU Stow symlinks into `$HOME`.
- `apps/` contains app-specific config that is copied or loaded separately.
- `examples/` contains templates for local-only personal config.

## Structure

```text
dotfiles/
├── packages/           # Stow packages symlinked into $HOME
│   ├── git/            # ~/.config/git/
│   ├── nvim/           # ~/.config/nvim/
│   ├── shell/          # ~/.fzf.zsh, ~/.hushlogin, ~/.gemrc
│   ├── starship/       # ~/.config/starship.toml
│   └── zsh/            # ~/.zshrc
├── apps/               # App configs not managed by Stow
│   ├── iterm2/
│   ├── vscode/
│   └── cursorrules/
├── examples/           # Local config templates
├── Brewfile
├── Makefile
└── install.sh
```
