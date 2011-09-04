#!/bin/bash

# OPTIONAL SCRIPT ARGUMENTS (kinda just hacked in):
#
# fast		- Perform a fast build.  This will skip BUILD-CONFIG and BUILD-MODULES.  Useful only for
#                 incremental builds that do not require updated .KO files to be placed into the zImage
#
# clean-platform	- Clean platform-based projects before building them.  Not compatible with FAST
#			 because I'm too lazy to do something better in here right now

# TOOLCHAIN / TOOLCHAIN_PREFIX
#
# External ARM Toolchain
export TOOLCHAIN=/opt/toolchains/arm-2010.09/bin
export TOOLCHAIN_PREFIX=arm-none-linux-gnueabi-

# ROOTDIR
#
# Root folder of this solution
export ROOTDIR=`pwd`

# ANDROIDROOTDIR
#
# Root ("TOP") folder of the Android platform solution
export ANDROIDROOTDIR=~/android/platform/android-2.3.4_r1

# BINDIR / BUILDDIR / DOCDIR / REFDIR / OUTDIR / SRCDIR
#
# bin   - Intermediate outputs
# build - Build scripts
# doc   - Documentation
# out   - Final outputs
# src   - Source code
export BINDIR=$ROOTDIR/bin
export BUILDDIR=$ROOTDIR/build
export DOCDIR=$ROOTDIR/doc
export OUTDIR=$ROOTDIR/out
export REFDIR=$ROOTDIR/ref
export SRCDIR=$ROOTDIR/src

# Verify project directories exist
if [ ! -d "$BUILDDIR" ]; then
	echo ">> ERROR: Project build script directory ["$BUILDDIR"] does not exist" 1>&2
	exit -1
fi
if [ ! -d "$REFDIR" ]; then
	echo ">> ERROR: Project reference file directory ["$REFDIR"] does not exist" 1>&2
	exit -1
fi
if [ ! -d "$SRCDIR" ]; then
	echo ">> ERROR: Project source code directory ["$SRCDIR"] does not exist" 1>&2
	exit -1
fi

# Verify Android Platform directory exists and that it has been built
if [ ! -d "$ANDROIDROOTDIR" ]; then
	echo ">> ERROR: Android platform root directory ["$ANDROIDROOTDIR"] does not exist" 1>&2
	exit -1
fi
# TODO: Check if built!

# BUILD-CLEAN
bash $BUILDDIR/build-clean.sh $1
if [[ $? -ne 0 ]]; then
	echo
	echo ">> ERROR in phase BUILD-CLEAN. Terminating build."
	exit
fi

# BUILD-CONFIG
if [ ! "$1" = "fast" ]; then 
	bash $BUILDDIR/build-config.sh
	if [[ $? -ne 0 ]]; then
		echo
		echo ">> ERROR in phase BUILD-CONFIG. Terminating build."
		exit
	fi
fi

# BUILD-MODULES
if [ ! "$1" = "fast" ]; then 
	bash $BUILDDIR/build-modules.sh
	if [[ $? -ne 0 ]]; then
		echo
		echo ">> ERROR in phase BUILD-MODULES. Terminating build."
		exit
	fi
fi

# BUILD-RAMDISK
bash $BUILDDIR/build-ramdisk.sh
if [[ $? -ne 0 ]]; then
	echo
	echo ">> ERROR in phase BUILD-RAMDISK. Terminating build."
	exit
fi

# BUILD-KERNEL
bash $BUILDDIR/build-kernel.sh
if [[ $? -ne 0 ]]; then
	echo
	echo ">> ERROR in phase BUILD-KERNEL. Terminating build."
	exit
fi

# BUILD-OUTPUT
bash $BUILDDIR/build-output.sh
if [[ $? -ne 0 ]]; then
	echo
	echo ">> ERROR in phase BUILD-OUTPUT. Terminating build."
	exit
fi

exit
