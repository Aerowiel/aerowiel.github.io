SUPPORTED_COMMANDS := npm
SUPPORTS_MAKE_ARGS := $(findstring $(firstword $(MAKECMDGOALS)), $(SUPPORTED_COMMANDS))
ifneq "$(SUPPORTS_MAKE_ARGS)" ""
  COMMAND_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(COMMAND_ARGS):;@:)
endif

npm: ## Run any npm command
	@docker-compose run --rm npm $(COMMAND_ARGS)

install: ## Install dependecies 
	@docker-compose run --rm npm install

start: ## Start a watcher and dev server with live reload
	@docker-compose up -d web

refresh: 
	@docker-compose down && make start

logs: ## Peek at dev server logs
	@docker-compose logs --tail=100 -f web

build: install ## Build project sources for deployment
	@docker-compose run --rm npm run build

lint: ## Run lint 
	@docker-compose run --rm web run lint

lint_fix: ## Run lint --fix
	@docker-compose run --rm web run lintfix
