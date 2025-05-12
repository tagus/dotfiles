# tagus dotfiles

common environment setup

we'll need to manually include the env setup files in `.zshrc`

```sh
# sourcing dotfiles
source ~/.config/.dotfiles/macros.zsh
source ~/.config/.dotfiles/setup_env.zsh
```

## minimal required dependencies

a lot of the configuration is dependent on other programs; eventually, I hope to have this be
automated through a script for but now please install them manually

```
- starship # better prompt
- vscode
- vim
```

## config setup

In most cases, the configs can be included within a top level config file however in some cases it makes
more sense to symbolically link the config file directly.

### symbolic links

```zsh
# link the common vscode user settings
ln -s ~/.config/.dotfiles/vscode.settings.json ~/.config/Code/User/settings.json
ln -s ~/.config/.dotfiles/starship.toml ~/.config/starship.toml
```

### include configs

for git, we can include the common `gitconfig` into the top level `~/.gitconfig` as follows

```toml
[include]
  path = ~/.config/.dotfiles/gitconfig
```

for vim, we can use the `include` directive to do ths same

```sh
source ~/.config/.dotfiles/common.vim
```

for kitty, we can include the common settings in the ~/.config/kitty/kitty.conf` file

```
include ~/.config/.dotfiles/kitty.common.conf
```

## vscode

some helpful extensions 

- vimvscodevim.vim
- chadalen.vscode-jetbrains-icon-theme
- tamasfe.even-better-toml