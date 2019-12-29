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
	cd package && stow --ignore=stowignore.* -t ../test-home-dir *

.PHONY: deploy
deploy:
	cd package && stow --ignore=stowignore.* -t ~ *

.PHONY: install
install:
	./script/install.sh config
	brew bundle -v --file=Brewfile

.PHONY: install-full
install-full:
	brew bundle -v --file=Brewfile-full

.PHONY: chmod
chmod:
	chmod +x script/*.sh config/*/install.sh

.PHONY: clean
clean:
	rm -rf test-home-dir
