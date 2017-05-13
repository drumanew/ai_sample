#!/bin/sh

PROJECT=$1
INSTALL_PATH=$2

if [ -z $PROJECT ]; then
  echo "PROJECT not defined"
  exit 1
fi

if [ -z $INSTALL_PATH ]; then
  echo "INSTALL_PATH not defined"
  exit 1
fi

INSTALL_DIR=$INSTALL_PATH/$PROJECT

echo "Installing $PROJECT in $INSTALL_DIR..."

echo "mkdir -p $INSTALL_DIR"
mkdir -p $INSTALL_DIR
RC=$?; if [ $RC -ne 0 ]; then exit $RC ; fi
echo OK

EBIN_DIRS=$(find . -name ebin | grep -v .erlang.mk)

for i in $EBIN_DIRS; do
  echo "Installing $i..."

  echo "mkdir -p $INSTALL_DIR/$i"
  mkdir -p $INSTALL_DIR/$i
  RC=$?; if [ $RC -ne 0 ]; then exit $RC ; fi
  echo OK

  echo "cp -r $i/* $INSTALL_DIR/$i"
  cp -r $i/* $INSTALL_DIR/$i
  RC=$?; if [ $RC -ne 0 ]; then exit $RC ; fi
  echo OK
done

echo "Installing sample.escript in $INSTALL_DIR..."

echo "cp sample.escript $INSTALL_DIR/"
cp sample.escript $INSTALL_DIR/
RC=$?; if [ $RC -ne 0 ]; then exit $RC ; fi
echo OK

echo "Install done."
