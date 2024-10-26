# tagus dotfiles

common environment setup

here's some common config that needs to be manually handled

```sh
## disables the last login time message that shows up
## everytime the shell starts up
touch ~/.hushlogin
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
ln -s ~/.config/dotfiles_sp/vscode.settings.json ~/.config/Code/User/settings.json
ln -s ~/.config/dotfiles_sp/starship.toml ~/.config/starship.toml
```

### include configs

for git, we can include the common `gitconfig` into the top level `~/.gitconfig` as follows

```toml
[include]
  path = ~/.config/dotfiles_sp/gitconfig
```

for vim, we can use the `include` directive to do ths same

```sh
source ~/.config/dotfiles_sp/common.vim
```

for kitty, we can include the common settings in the ~/.config/kitty/kitty.conf` file

```
include ~/.config/dotfiles_sp/kitty.common.conf
```