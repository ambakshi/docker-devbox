.PHONY: all build run

UID := $(shell id -u)
GID := $(shell id -g)
NUSER:=$(shell echo $(USER) | sed 's/\./_/g')
all: build run

.gitconfig.local:
	@git config -f $@.tmp user.name `git config user.name`
	@git config -f $@.tmp user.email `git config user.email`
	@mv $@.tmp $@

Dockerfile: Dockerfile.in
	sed -e 's/developer/'$(USER)'/g' -e 's/1000/'$(UID)'/g' -e 's/1111/'$(GID)'/g' $< > $@

build: Dockerfile
	docker build -t $(NUSER)/dev:centos7 .

push:
	docker tag `docker images | grep $(NUSER)/dev | awk '$$2 = /centos7/{print $$3}' | head -1` ops-docker:5000/$(NUSER)/dev:centos7
	docker push ops-docker:5000/$(NUSER)/dev:centos7

run:
	docker run -ti -v `pwd`:/data:ro -h $(HOSTNAME)-docker --rm $(NUSER)/dev:centos7 /bin/bash
