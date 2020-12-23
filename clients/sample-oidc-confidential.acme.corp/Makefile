VAULT_CMD := aws-vault exec $(AWS_PROFILE) --
TF_CMD := terraform
CMD := $(VAULT_CMD) $(TF_CMD)

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
SED_ARGS := -i ''
else
SED_ARGS := -i
endif

.PHONY: help all deps init apply destroy migrate

help:
	@echo 'Provision Keycloak Client'
	@echo ''
	@echo 'Requirements:'
	@echo '  aws-vault, terraform'
	@echo ''
	@echo 'Usage:'
	@echo '  make all             init, (implicit) plan, apply, migrate state'
	@echo '  make apply           apply changes'
	@echo '  make destroy         destroy client and state resources'

all: deps init apply migrate

deps:
	@echo 'Checking dependencies...'
	@which aws-vault
	@which terraform

init:
	$(CMD) init

apply:
	$(CMD) apply -auto-approve

destroy:
	@grep -q '#.*backend' main.tf || sed $(SED_ARGS) 's/\(backend "s3"\)/#\1/g' main.tf
	$(CMD) init -force-copy
	$(CMD) destroy

migrate:
	@grep -q '#.*backend' main.tf && sed $(SED_ARGS) 's/#.*\(backend "s3".*\)/\1/g' main.tf
	$(CMD) init -backend-config=backend.tfvars -force-copy
