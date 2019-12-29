TEST_DIR = test-home-dir
STOW = stow --no-folding --ignore=install.sh --ignore=stowignore

.PHONY: help
help:
	cat Makefile

.PHONY: init
init:
	command -v brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	command -v stow || brew install stow

.PHONY: deploy-test
deploy-test:
	mkdir -p test-home-dir
	cd package && $(STOW) -t ../$(TEST_DIR) *

.PHONY: deploy
deploy:
	cd package && $(STOW) -t ~ *

.PHONY: install
install:
	find package -name install.sh -execdir bash {} \;
	brew bundle -v --file=data/Brewfile-basic

.PHONY: install-full
install-full:
	brew bundle -v --file=data/Brewfile-full

.PHONY: chmod
chmod:
	chmod +x script/*.sh package/*/install.sh

.PHONY: clean
clean:
	rm -rf $(TEST_DIR)
