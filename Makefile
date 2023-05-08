UID = $(shell id -u)
GID = $(shell id -g)
UNAME = $(shell whoami)

build:
	docker build --build-arg TARGET_UID=${UID} . -t sagelab-${UNAME}

run:
	docker run --rm -p8888:8888 --user ${UID}:${GID} --name sagelab-${UNAME} -v ${PWD}/notebooks:/home/sage/notebooks sagelab-${UNAME}:latest sage-jupyter

attach:
	docker exec -it sagelab-${UNAME} bash

stop:
	docker stop sagelab-${UNAME}
