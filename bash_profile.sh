#!/bin/bash

DOTFILES="${DOTFILES:-${HOME}/.config/.dotfiles}"

source "${DOTFILES}/shell/macros.sh"
source "${DOTFILES}/shell/setup_env.sh"

for local_script in "${DOTFILES}"/shell/local/*.sh; do
  [[ -r "${local_script}" ]] || continue
  source "${local_script}"
done
