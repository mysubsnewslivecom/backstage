-include .env
SHELL=/bin/bash
LOG := @printf "\033[32m%s \033[0m\n"
MAKEFLAGS += --silent

.PHONY: help

help: ## Show help message
	# @printf "\033[32m\xE2\x9c\x93 usage: make [target]\n\n\033[0m"
	@printf "\033[32musage: make [target]\n\n\033[0m"
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build
	$(LOG) "Build app"
	cd packages/app ;yarn build --config ../../app-config.local.yaml; cd -
	$(LOG) "Build backend"
	cd packages/backend ;yarn build --config ../../app-config.local.yaml; cd -
	$(LOG) "Build app image"
	DOCKER_BUILDKIT=1 docker image build . \
		-f packages/app/Dockerfile --tag ui
	$(LOG) "Build backend image"
	DOCKER_BUILDKIT=1 docker image build . \
		-f packages/backend/Dockerfile --tag backend

drun: ## run docker images
	$(LOG) "Docker run UI"
	docker run -it --rm --network alpine-net -d \
		--name ui --env-file .env -p 3000:3000 ui
	$(LOG) "Docker run backend"
	docker run -it --rm --network alpine-net -d \
		--name backend --env-file .env -p 7007:7007 backend

drm: ## Remove docker images
	$(LOG) "Remove docker images"
	docker rm -f ui backend
