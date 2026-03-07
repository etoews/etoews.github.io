export IMAGE := etoews/jekyll:4.4.1

.PHONY: preview build-and-push help

help:
	@echo "make preview          Run local Jekyll preview"
	@echo "make build-and-push   Build Docker image and push to Docker Hub"

build-and-push:
	bash build-and-push-image.sh

preview:
	bash preview.sh
