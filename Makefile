UID = $(shell id -u)
GID = $(shell id -g)

build:
	docker build . -t sagelab

run:
	docker run --rm -p8888:8888 --user ${UID}:${GID} --name sagelab -v ${PWD}/notebooks:/home/sage/notebooks sagelab:latest sage-jupyter

attach:
	docker exec -it sagelab bash

