PROJECT = ai_sample
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0

DEPS = seresye
dep_seresye = git https://github.com/afiniate/seresye master

include erlang.mk

all::
	./make_cf.sh
	sed -e 's/@ebin_subst@/$(shell ./ebin.sh)/g' sample.escript.in > sample.escript
	chmod +x sample.escript

clean::
	rm -f sample.escript
