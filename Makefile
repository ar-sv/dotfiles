.PHONY: help install update uninstall

help: ## Show commands
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

install: ## Set up this machine
	./install.sh

update: ## Pull latest and apply setup
	git pull --ff-only
	./install.sh

uninstall: ## Remove dotfile symlinks
	cd packages && stow --verbose --target="$(HOME)" --delete */
