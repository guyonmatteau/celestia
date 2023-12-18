.PHONY: deploy

include .env
export 

RG = rg-node-01
FILE = deploy.yml

deploy:
	#source .env
	envsubst < deploy.tpl > deploy.yml
	az container create --resource-group $(RG) --file $(FILE) --output json


