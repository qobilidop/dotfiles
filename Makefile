.PHONY: deploy
deploy:
	git pull
	./script/deploy.sh
	./script/install.sh
	./script/configure.sh

.PHONY: ext
ext:
	./script/install-ext.sh

.PHONY: plus
plus:
	brew bundle -v --file=config/Brewfile-plus
