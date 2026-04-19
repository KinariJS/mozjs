#!/bin/sh

VERSION=$(cat ../FIREFOX_VERSION)
VER="${VERSION%.*}"

mkdir -p _build
cd _build

../configure $(cat ../../CONFIGURE_ARGS)

make -j $(nproc)

# Create missing library
ar rcs libmozglue.a $(grep "../../../" js/src/shell/js.list | sed "s|../../../||")

# Merge all required libraries
MOZJS=$(pwd)/libmozjs.a
ar rcs libmozjs.a js/src/build/libjs_static.a libmozglue.a x86_64-unknown-linux-gnu/debug/libjsrust.a

# Installation
mkdir _install

make DESTDIR=$(pwd)/_install install

INCL=_install/include/mozjs-$VER/

# Fix include
mv $INCL/ProfilingCategoryList.h $INCL/mozilla/ProfilingCategoryList.h
rm -rf _install/bin
rm -f _install/lib/libjs_static.ajs
cd _install/lib/

# Extract our libs
ar x $MOZJS
