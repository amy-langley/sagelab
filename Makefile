build:
	docker build . -t sagelab

run:
	docker run -p8888:8888 --name sagelab -v ${PWD}/notebooks:/home/sage/notebooks sagelab:latest sage-jupyter

attach:
	docker exec -it sagelab bash

