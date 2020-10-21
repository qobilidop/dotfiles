PREVIEW_DIR = home-preview

.PHONY: help
help:
	cat Makefile

.PHONY: init
init:
	-xcode-select --install
	command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	command -v mas || brew install mas
	command -v stow || brew install stow

.PHONY: deploy-preview
deploy-preview:
	./script/deploy.py $(PREVIEW_DIR)

.PHONY: deploy
deploy:
	./script/deploy.py ~

.PHONY: install-all
install-all:
	$(MAKE) install-core
	$(MAKE) install-lite
	$(MAKE) install-full

.PHONY: install-core
install-core:
	./script/install.py package/0-core

.PHONY: install-lite
install-lite:
	./script/install.py package/1-lite

.PHONY: install-full
install-full:
	./script/install.py package/2-full

.PHONY: clean
clean:
	rm -rf $(PREVIEW_DIR)
	rm -rf package/*/Brewfile.lock.json
