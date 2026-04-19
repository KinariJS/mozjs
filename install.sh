#!/bin/sh

mkdir -vp "$(pwd)/miniroot"
mkdir -vp "$(pwd)/miniroot/lib"
mkdir -vp "$(pwd)/miniroot/include"

ROOT="$(pwd)/miniroot"

cd firefox/_build/_install

cp -rv ./lib/* $ROOT/lib
cp -rv ./include/* $ROOT/include
