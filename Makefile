.PHONY: help
help:
	cat Makefile

.PHONY: build
build:
	./script/build.sh config build

.PHONY: deploy-test
deploy-test:
	mkdir -p test-home-dir
	./script/deploy.sh build test-home-dir

.PHONY: deploy
deploy:
	./script/deploy.sh build ~

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
	rm -rf build
