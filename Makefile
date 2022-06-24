VENV ?= ~/.venv
BRANCH ?=
PYTHON ?= python3
PIP ?= pip3
SHELL = /bin/bash
ANSIBLE_PATH ?= ansible
USER ?= user
export PATH := $(CURDIR)/$(VENV)/bin:$(PATH)
export ANSIBLE_HOST_KEY_CHECKING=False

define source_venv
	source $(VENV)/bin/activate
endef

.PHONY: act
act:
	test -d $(VENV) || $(PYTHON) -m venv $(VENV);
	source $(VENV)/bin/activate;
	$(PYTHON) -m pip install -U pip;
	$(PIP) install -r images/requirements.txt

.PHONY: build
build: act
	source $(VENV)/bin/activate;\
	cd $(ANSIBLE_PATH);\
	ansible-playbook -i $(BRANCH) --private-key=~/.ssh/id_rsa bootstrap_cluster.yml 

.PHONY: clean
clean:
	@echo "clean operation"
	rm -rf $(VENV)