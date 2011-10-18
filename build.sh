#!/bin/bash

# DATE / TIME EXPORTS
export DATE=$(date +%m%d)
export TIME=$(date +%H%M)

# TOOLCHAIN / TOOLCHAIN_PREFIX
#
# External ARM Toolchain
export TOOLCHAIN=/home/vb/toolchain/android-toolchain-eabi/bin
export TOOLCHAIN_PREFIX=arm-eabi-

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
# out   - Final outputs
# src   - Source code
export BINDIR=$ROOTDIR/bin
export BUILDDIR=$ROOTDIR/build
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

# TODO: Check if built (how?)

# BUILD-CLEAN
if [ "$1" = "clean" ]; then 
	bash $BUILDDIR/build-clean.sh $1
	if [[ $? -ne 0 ]]; then
		echo
		echo ">> ERROR in phase BUILD-CLEAN. Terminating build."
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
