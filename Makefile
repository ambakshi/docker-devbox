.PHONY: all build run

UID := $(shell id -u)
NUSER:=$(shell echo $(USER) | sed 's/\./_/g')
all: build run

Dockerfile: Dockerfile.in
	sed -e 's/developer/'$(USER)'/g' -e 's/1000/'$(UID)'/g' $< > $@

build: Dockerfile
	docker build -t $(NUSER)/dev:centos7 .

push:
	docker tag `docker images | grep $(NUSER)/dev | awk '$$2 = /centos7/{print $$3}' | head -1` ops-docker:5000/$(NUSER)/dev:centos7
	docker push ops-docker:5000/$(NUSER)/dev:centos7

run:
	docker run -ti -v `pwd`:/data:rw -h $(HOSTNAME)-docker --rm $(NUSER)/dev:centos7 /bin/bash
