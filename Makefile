
IMAGE_NAME=bookbag-wasm-io
TAG=latest
CONTAINER_ENGINE=podman
CONTAINER_FILE=Dockerfile
BOOKBAG_EXTERNAL_PORT=8000
EXTRA_ARGS=

# Adjust to taste

: ## TIP! make supports tab completion with *modern* shells e.g. zsh etc
: ## e.g. make depl<TAB> == make deploy 
: ## 

.SILENT: setup my-env ssh-target

help: ## Show this help - technically unnecessary as `make` alone will do
help: ## 
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", ($$2=="" ? "" : $$1 ),  $$2}' | less

# Thanks to victoria.dev for the above syntax
# https://victoria.dev/blog/how-to-create-a-self-documenting-makefile/

build: ## Build local bookbag image 
build: ##     Defaults to podman and tags latest
build: ## 
	$(CONTAINER_ENGINE) build \
		-f $(CONTAINER_FILE) \
		-t $(IMAGE_NAME):$(TAG) \
		.

run: ## Run container image locally
run: ## 
	$(CONTAINER_ENGINE) run \
		--rm \
		--name $(IMAGE_NAME) \
		-p $(BOOKBAG_EXTERNAL_PORT):10080 \
		-d $(IMAGE_NAME):$(TAG) \
	$(EXTRA_ARGS)

all: build run

stop: kill

kill:
	$(CONTAINER_ENGINE) kill $(IMAGE_NAME)
