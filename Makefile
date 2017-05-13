PROJECT = ai_sample
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0

DEPS = seresye
dep_seresye = git https://github.com/afiniate/seresye master

include erlang.mk

EBIN_DIRS = $(shell find . -name ebin | grep -v .erlang.mk)

INSTALL_PATH ?= /opt/

all::
	./make_cf.sh
	sed -e 's/@ebin_subst@/$(shell ./ebin.sh)/g' sample.escript.in > sample.escript
	chmod +x sample.escript

clean::
	rm -f sample.escript

install: all
	./install.sh $(PROJECT) $(INSTALL_PATH)

clean-install:
	./clean-install.sh $(PROJECT) $(INSTALL_PATH)
