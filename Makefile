.PHONY: build shell run

PORT := 27960
DOCKER_IMAGE := tomdesinto/urbanterror:4.2.018

build:
	docker build --rm --tag "$(DOCKER_IMAGE)" .

prepare-game-dir:
	[ ! -d q3ut4 ] && mkdir q3ut4 ||:

run: prepare-game-dir
	docker run --detach --net host --publish $(PORT):27960/udp --volume $$(pwd)/q3ut4:/q3ut4 "$(DOCKER_IMAGE)"

shell: prepare-game-dir
	docker run --rm --tty --interactive --net host --publish $(PORT):27960/udp --volume $$(pwd)/q3ut4:/q3ut4 "$(DOCKER_IMAGE)" /bin/bash -l
