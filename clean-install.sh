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

echo "Uninstalling $PROJECT from $INSTALL_DIR..."

echo "rm -rfv $INSTALL_DIR"
rm -rfv $INSTALL_DIR
RC=$?; if [ $RC -ne 0 ]; then exit $RC ; fi
echo OK

echo "Uninstall done."
