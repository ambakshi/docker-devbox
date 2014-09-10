TOP:=$(shell pwd)

run:
	docker run -p 8080:8080 -v $(TOP)/war:/war -t ambakshi/tomcat8 /opt/tomcat/bin/deploy-and-run.sh

build:
	docker build -t ambakshi/tomcat8 .
