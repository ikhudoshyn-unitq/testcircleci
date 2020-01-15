all: docker

ACTIVATE := venv/bin/activate

init:
	python3 -m virtualenv venv
	(. $(ACTIVATE); pip3 install -r requirements.txt;)

install: init
	(. $(ACTIVATE); ./setup.py install)

test: install
	(. $(ACTIVATE); python3 -m pytest --capture=sys -s tests/)

docker:
	docker build -t gluke77/testservice:latest -f Dockerfile .

.PHONY: init test install docker
