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

t:
	. ./.env; \
	mkdir -p ~/.ide/${SUB}/{.local,projects,.ssh}; \
	docker build -t $$(echo $${IMAGE}):$${SUB} --build-arg USER=$${USER} --build-arg EMAIL=$${EMAIL} --build-arg SUB=$${SUB} --build-arg IDE_LANG=$${IDE_LANG} .

test:
	. ./.env; \
	echo $$(echo $${IMAGE}):dev

deploy:
	. ./.env; \
	docker push $${IMAGE}:$${ENV}

