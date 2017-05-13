#!/bin/sh
EBIN_DIRS=$(find . -name ebin | grep -v .erlang.mk)
EBIN_SUBST=$(for i in $EBIN_DIRS; do echo -pa $PWD/$i | sed -e 's/\//\\\//g'; done)

echo $EBIN_SUBST
