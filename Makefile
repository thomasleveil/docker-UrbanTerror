.PHONY: build shell run

PORT := 27960
DOCKER_IMAGE := tomdesinto/urbanterror:4.2.018

build:
	docker build --rm --tag "$(DOCKER_IMAGE)" .

run:
	[ ! -d q3ut4 ] && mkdir q3ut4 ||:
	docker run --detach --publish $(PORT):27960/udp --volume q3ut4:/q3ut4 "$(DOCKER_IMAGE)"

shell:
	docker run --rm --tty --interactive --publish $(PORT):27960/udp "$(DOCKER_IMAGE)" /bin/bash -l
