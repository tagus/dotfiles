.PHONY: codex-link-skills install-symlinks

# symlink each top-level repo skill into ~/.codex/skills for local Codex discovery.
codex-link-skills:
	mkdir -p "$(HOME)/.codex/skills"
	for dir in "$(CURDIR)"/skills/*; do \
		[ -d "$$dir" ] || continue; \
		ln -sfn "$$dir" "$(HOME)/.codex/skills/$$(basename "$$dir")"; \
	done

# install the repo-managed config symlinks described in the README.
install-symlinks:
	mkdir -p "$(HOME)/.config"
	ln -sfn "$(CURDIR)/starship.toml" "$(HOME)/.config/starship.toml"
	ln -sfn "$(CURDIR)/tmux.conf" "$(HOME)/.tmux.conf"
	ln -sfn "$(CURDIR)/nvim" "$(HOME)/.config/nvim"
	if [ -d "$(HOME)/Library/Application Support/Code/User" ]; then \
		ln -sfn "$(CURDIR)/vscode/settings.json" "$(HOME)/Library/Application Support/Code/User/settings.json"; \
	fi
