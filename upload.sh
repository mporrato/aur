#!/bin/sh

PKGDIR=${1:-.}

if [ -e "$PKGDIR/PKGBUILD" ] ; then
	olddir="$PWD"
	cd "$PKGDIR"
	mkaurball -e
	burp *.src.tar.*
	cd "$olddir"
else
	echo "ERROR: $PKGDIR does not contain a PKGBUILD"
fi

