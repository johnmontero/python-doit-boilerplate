.DEFAULT_GOAL := help

## GENERAL ##
BUILD_NUMBER 	?= 000001
BUILD_TIMESTAMP ?= `date +%Y%m%d`
APP_DIR          = "app"
VENV_DIR         = "venv"

## RESULT_VARS ##
PROJECT_NAME    = "python-doit-boilerplate"
CONTAINER_NAME  = ${PROJECT_NAME}_dev
TAG_DEPLOY		= ${BUILD_TIMESTAMP}.${BUILD_NUMBER}
IMAGE_DEPLOY	= ${PROJECT_NAME}:${TAG_DEPLOY}
IMAGE_DEV       = ${PROJECT_NAME}:dev



##################################################################
#### Development Commands
##################################################################

ssh: ## Conectar al container por el protocolo ssh: make ssh
	docker container run --workdir "/${APP_DIR}" --rm -it -v "${PWD}/${VENV_DIR}":/${VENV_DIR} -v "${PWD}/${APP_DIR}":/${APP_DIR} ${IMAGE_DEV} "/bin/zsh"

build: ## Construir imagen para development: make build
	docker build -f docker/dev/Dockerfile -t $(IMAGE_DEV) docker/dev/ --no-cache

build-last: ## Construir imagen para deploy: make build-last
	docker build -f docker/latest/Dockerfile --no-cache --build-arg IMAGE=$(IMAGE_DEV) -t $(IMAGE_DEPLOY) .
	@echo "docker container run --rm -t $(IMAGE_DEPLOY) do-it version" > do-it.sh
	@chmod 755 $(PWD)/do-it.sh

venv-create: ## Crea el entorno virtual (virtualenv): make venv-create
	docker container run --workdir "/${APP_DIR}" --rm -it -v "${PWD}/${VENV_DIR}":/${VENV_DIR} -v "${PWD}/${APP_DIR}":/${APP_DIR} --tty=false ${IMAGE_DEV}  python3 -m venv /${VENV_DIR}

venv-install-lib: ## Instala las librerias en el entorno virtual (virtualenv): make venv-install-lib
	docker container run --workdir "/${APP_DIR}" --rm -it -v "${PWD}/${VENV_DIR}":/${VENV_DIR} -v "${PWD}/${APP_DIR}":/${APP_DIR} --tty=false ${IMAGE_DEV}  "/${VENV_DIR}/bin/pip" install -r requirements.txt


## Target Help ##

help:
	@printf "\033[31m%-16s %-59s %s\033[0m\n" "Target" "Help" "Usage"; \
	printf "\033[31m%-16s %-59s %s\033[0m\n" "------" "----" "-----"; \
	grep -hE '^\S+:.*## .*$$' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' | sort | awk 'BEGIN {FS = ":"}; {printf "\033[32m%-16s\033[0m %-58s \033[34m%s\033[0m\n", $$1, $$2, $$3}'

