#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTDIR=`dirname ${SCRIPT}`
PKGDIRS=`find "${SCRIPTDIR}" -mindepth 2 -maxdepth 2 -type f -name PKGBUILD -printf "%h "`

curdir="${PWD}"
for pkg in ${PKGDIRS} ; do
	cd "$pkg"
	if [ -e .gitignore ] ; then 
		for ign in `grep -v '^#' .gitignore | sed -e 's:/$::g'` ; do
			find "$pkg" -maxdepth 1 -name "$ign" -exec rm -rfv \{\} \;
		done
	else
		echo "WARNING: Package ${pkg} has no .gitignore" 
	fi
done
cd "$curdir"
