.PHONY: docker

docker:
	. ./.env; \
	docker build --build-arg USER=$${USER} --build-arg EMAIL=$${EMAIL} --build-arg IDE_LANG=$${IDE_LANG} -t $${IMAGE}:$${ENV} .

golang:
	. ./.env; \
	docker build --build-arg USER=$${USER} --build-arg EMAIL=$${EMAIL} --build-arg IDE_LANG=golang -t $${IMAGE}:$${ENV} .

dev:
	. ./.env; \
	docker build -t $$(echo $${IMAGE}):dev --build-arg USER=$${USER} --build-arg EMAIL=$${EMAIL} --no-cache .

test:
	. ./.env; \
	echo $$(echo $${IMAGE}):dev

deploy:
	. ./.env; \
	docker push $${IMAGE}:$${ENV}

