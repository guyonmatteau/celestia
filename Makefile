.PHONY: deploy

include .env
export 

RG = rg-node-01
TEMPLATE = deploy.yml
OUTPUT = deploy.yaml

deploy:
	envsubst < deploy.yml > deploy.yaml
	az container create --resource-group $(RG) --file $(OUTPUT) --output json


