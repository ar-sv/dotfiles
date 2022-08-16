### Iterm2

Set "General > Preferences > Load..." to the `iterm2` folder in this repo.

### Local environment
* `~/.zshrc.local`
* `~/.gitconfig.local`

### Prerequisites
* `make install_deps`

### TODO
* Copy and paste from NeoVim
* TMux settings
* VSCode settings

### Manual

SSH Agent

In ~/.ssh/config

```
Host *
    VisualHostKey yes
    UserKnownHostsFile ~/.ssh/known_hosts
    SendEnv TZ COLORTERM
    ServerAliveInterval 180
    ForwardAgent no
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa
```
