.PHONY: help
help:
	cat Makefile

.PHONY: init
init:
	./script/configure
	./script/install
	conda env create -f config/conda-env-lab.yml
	./script/install-vscode-extensions

.PHONY: up
up:
	git pull
	conda env update -f config/conda-env-lab.yml
	./script/install-vscode-extensions
