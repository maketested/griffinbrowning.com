.PHONY: all
all: build

.PHONY: install
install: public $(shell gitman show --log)
$(shell gitman show --log): $(shell gitman show --config)
	gitman install
	gitman list
public:
	git clone https://github.com/maketested/griffinbrowning.com public

.PHONY: run
run: install
	hugo serve

.PHONY: build
build: install
	hugo

.PHONY: upload
upload: build
	cd public && git commit && git push
