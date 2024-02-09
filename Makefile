IMAGE_NAME := kanynini-tinycore
IMAGE_TAG := py3.6

.PHONY: all clean build

all: clean build

build:
	docker build -m 2048 -t $(IMAGE_NAME):$(IMAGE_TAG) .
	docker tag $(IMAGE_NAME):$(IMAGE_TAG) $(IMAGE_NAME):latest

clean:
	docker images $(IMAGE_NAME) | grep -q $(IMAGE_TAG) && docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true
	docker images $(IMAGE_NAME) | grep -q latest && docker rmi $(IMAGE_NAME):latest || true

run:
	docker run -it $(IMAGE_NAME):$(IMAGE_TAG) 