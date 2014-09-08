.PHONY: all build run

UID := $(shell id -u)

all: build run

Dockerfile: Dockerfile.in
	sed -e 's/developer/'$(USER)'/g' -e 's/1000/'$(UID)'/g' $< > $@

build: Dockerfile
	docker build -t $(USER)/dev:centos7 .

push:
	docker tag `docker images | grep jenkins/dev | awk '$$2 = /centos7/{print $$3}' | head -1` ops-docker:5000/$(USER)/dev:centos7
	docker push ops-docker:5000/$(USER)/dev:centos7 

run:
	docker run -ti -v `pwd`:/data:rw --rm $(USER)/dev:centos7 /bin/bash
