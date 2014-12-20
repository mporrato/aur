#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTDIR=`dirname ${SCRIPT}`

find "${SCRIPTDIR}" -maxdepth 2						\
	\( -type d \( -name src -o -name pkg \) \) -o			\
	\( -type f \( -name "*.src.tar.*" -o				\
		      -name "*.pkg.tar.*" -o				\
		      -name "*.log"					\
		   \)							\
	\)								\
	-exec rm -rv \{\} \;

