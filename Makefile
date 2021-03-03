###############################
 ## bucardo manger database ##
###############################

include .env

# Docker specific
ENV_FILE := .env
PROJECT_NAME := infodengue
COMPOSE_FILE := docker/bucardo-compose.yml
DOCKER := docker-compose -p $(PROJECT_NAME)
DOCKER_UP := up  --remove-orphans -d --no-build
DOCKER_STOP := rm --force --stop

SERVICES := bucardo_manager

# Configure database in the container
build_bucardo:
	$(DOCKER) -f $(COMPOSE_FILE) --env-file $(ENV_FILE) build

deploy_bucardo:
	$(DOCKER) -f $(COMPOSE_FILE) --env-file $(ENV_FILE) $(DOCKER_UP)

exec_bucardo:
	$(DOCKER) -f $(COMPOSE_FILE) --env-file $(ENV_FILE) exec $(SERVICES) bash


stop_bucardo:
	$(DOCKER) -f $(COMPOSE_FILE) --env-file $(ENV_FILE) $(DOCKER_STOP)


clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '*.pyo' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
