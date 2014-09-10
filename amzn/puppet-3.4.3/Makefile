.PHONY: run all

INSTANCE_ID=i-$(shell date +%s)
H=app-mwios-$(INSTANCE_ID).int.funzio.com
S=puppet.int.funzio.com

run:
	docker run -ti --rm -h $(H) amzn/puppet343 /usr/bin/puppet agent --test --certname $(H) --server $(S) --waitforcert 60

build:
	docker build --rm -t amzn/puppet343 .

inspect:
	docker run -ti --rm -h $(H) amzn/puppet343 /bin/bash
