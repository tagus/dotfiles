# dotfiles

my shell/editor config.

this repo is mostly:

- a small bash bootstrap
- shared shell setup
- some helper macros
- local machine overrides
- a few config files that get symlinked into place

## what's here

- `bash_profile.sh`: main shell entrypoint
- `shell/setup_env.sh`: aliases, PATH, editor, prompt, shell deps
- `shell/macros.sh`: helper functions
- `shell/local/*.sh`: local-only stuff sourced last
- `.gitconfig`: shared git config + aliases
- `vscode.settings.json`: vscode settings
- `starship.toml`: prompt config
- `tmux.conf`: tmux config
- `ghostty.config`: ghostty config
- `nvim/`: neovim config

## shell setup

source this from `~/.bash_profile`:

```bash
source ~/.config/.dotfiles/bash_profile.sh
```

`bash_profile.sh` uses `DOTFILES` if it's already set. otherwise it defaults to:

```bash
~/.config/.dotfiles
```

load order is:

1. `shell/setup_env.sh`
2. `shell/macros.sh`
3. every readable file in `shell/local/*.sh`

the idea is that shared stuff lives in `shell/` and machine/work-specific stuff
lives in `shell/local/`.

## deps

these are the main ones the shell setup expects:

- `bat`
- `eza`
- `fzf`
- `zoxide`
- `starship`
- `nvim`
- `tmux`

some helpers also assume tools like `jq`, `tree`, `kubectl`, `lazygit`, and
ImageMagick's `convert`.

## symlinks / includes

link these into the right place:

```bash
ln -sf ~/.config/.dotfiles/vscode.settings.json "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf ~/.config/.dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/.config/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.config/.dotfiles/nvim ~/.config/nvim
```

for ghostty, add this to the default config:

```ini
config-file = /Users/spoudel/.config/.dotfiles/ghostty.config
```

for git, include this from `~/.gitconfig`:

```ini
[include]
	path = ~/.config/.dotfiles/.gitconfig
```

## a few notable things

- `vim` is aliased to `nvim`
- `cd` is aliased to `z`
- starship, `fzf`, and `zoxide` get initialized in `shell/setup_env.sh`
- `tmux.conf` uses `Ctrl-Space` as the main prefix and keeps `Ctrl-B` as a secondary one
- `shell/macros.sh` has helpers like `exists`, `port`, `ts`, and `tdl`
- `tdl -c` sets up a tmux dev layout and resumes the last `codex` session if available

## local overrides

anything in `shell/local/*.sh` is sourced automatically after the shared setup.

for example:

- `shell/local/setup_env.sh`
- `shell/local/macros.sh`

## neovim

the neovim config is under `nvim/`.

it's a lazyvim-based setup with local config/plugin overrides in `nvim/lua/`.
