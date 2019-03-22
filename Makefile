.PHONY: help
help:
	cat Makefile

.PHONY: init
init:
	./script/configure
	./script/setup-macos
	./script/setup-crypto-key
	@echo
	conda env create -f config/conda-env-lab.yml

.PHONY: ext
ext:
	brew bundle -v --file=config/Brewfile-ext

.PHONY: up
up:
	git pull
	./script/configure
	./script/setup-macos
	@echo
	conda env update -f config/conda-env-lab.yml
