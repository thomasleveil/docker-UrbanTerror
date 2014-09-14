.PHONY: build shell run

PORT = 27960
DOCKER_IMAGE = tomdesinto/urbanterror:4.2.019
DOCKER_CONTAINER = urt42

build:
	docker build --rm --tag "$(DOCKER_IMAGE)" .

clean:
	docker rm -f $(DOCKER_CONTAINER) ||:

prepare-game-dir:
	[ ! -d q3ut4 ] && mkdir q3ut4 ||:

run: clean prepare-game-dir
	docker run --detach --net host --publish $(PORT):27960/udp --volume $$(pwd)/q3ut4:/q3ut4 --name $(DOCKER_CONTAINER) "$(DOCKER_IMAGE)"

logs:
	docker logs -f $(DOCKER_CONTAINER)

shell: prepare-game-dir
	docker run --rm --tty --interactive --net host --publish $(PORT):27960/udp --volume $$(pwd)/q3ut4:/q3ut4 "$(DOCKER_IMAGE)" /bin/bash -l
