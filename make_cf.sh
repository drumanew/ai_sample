#!/bin/sh

cd deps/cf
rebar compile
cd ../..

echo OK
