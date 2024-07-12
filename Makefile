SHELL:=/bin/bash
.ONESHELL:

.PHONY: init
init: ## Initial installation of argocd and the app-of-apps
	@kubectl create namespace argocd | true
	@kubectl apply -n argocd -k ./teams/platform/argocd
	sleep 1
	@kubectl apply -n argocd -k ./_argocd

.PHONY: deps
deps: ## Install all dependencies
	# argocd cli
	brew install argocd

.PHONY: update_admin	
update_admin: ## Update admin password
	@bash ./scripts/bash/update-pass.sh "localhost:8888" "admin" "admin123"

.PHONY: get_admin_pass
get_admin_pass: ## Get current admin password
	@kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

.PHONY: rancher_context
rancher_context: ## Initial installation of argocd and the app-of-apps
	@kubectl config use-context rancher-desktop

.PHONY: add_repo
add_repo: ## Add repo to the argocd
	@bash ./scripts/bash/add-repo.sh

.PHONY: forward
forward: ## Port forward for argocd-server
	@kubectl port-forward svc/argocd-server -n argocd 8888:443 

.PHONY: help
help: ## Display help screen
	@echo "Usage:"
	@echo "	make [COMMAND]"
	@echo "	make help "
	@echo "Commands:"
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
