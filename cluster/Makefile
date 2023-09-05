.PHONY: help
help: ## Lista os opções de execução do ambiente
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

.PHONY: init
init: ## Inicializa as configurações do Terraform
	terraform init -upgrade=true

.PHONY: plan
plan: ## Executa o planejamento de execução do Terraform
	terraform plan

.PHONY: up
up: ## Inicializa o cluster Kubernetes rodando em ambiente local usando Docker
	terraform apply -auto-approve

.PHONY: down
down: clean ## Remove as configurações do Terraform para o ambiente e deleta o cluster Kubernetes
	kind delete cluster --name devops

.PHONY: clean
clean: ## Remove todos os arquivos de configurações gerados pelo Terraform
	rm -rf .terraform .terraform.lock.hcl terraform.tfstate*