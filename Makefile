IMAGE_NAME := tinycore-python
IMAGE_TAG := 3.7_with_pkg

.PHONY: all clean build

all: clean build

build:
	docker build -m 2048 -t $(IMAGE_NAME):$(IMAGE_TAG) .
	docker tag $(IMAGE_NAME):$(IMAGE_TAG) $(IMAGE_NAME):latest

clean:
	docker images $(IMAGE_NAME) | grep -q $(IMAGE_TAG) && docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true
	docker images $(IMAGE_NAME) | grep -q latest && docker rmi $(IMAGE_NAME):latest || true

run:
	docker run -it --rm --platform linux/amd64 --net=host --privileged -v /dev:/dev -v /Users/robertodelprete/Desktop/KANYINI/ncsdk/:/home/tc  --user tc $(IMAGE_NAME):$(IMAGE_TAG) /bin/sh

run_from_hub:
	docker pull tatsushid/tinycore-python:3.6
	docker run -it --net=host --privileged -v /dev:/dev -v /Users/robertodelprete/Desktop/KANYINI/ncsdk/:/home/tc  --user tc tatsushid/tinycore-python:3.6 /bin/sh
