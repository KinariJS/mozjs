#!/bin/sh

VERSION="$(cat FIREFOX_VERSION)"

if [ ! -f firefox-$VERSION.source.tar.xz ]; then
    wget https://ftp.mozilla.org/pub/firefox/releases/$VERSION/source/firefox-$VERSION.source.tar.xz
fi

tar xf firefox-$VERSION.source.tar.xz
mv "firefox-${VERSION%.*}"*/ firefox
