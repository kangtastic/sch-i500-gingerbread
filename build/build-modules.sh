#!/bin/bash

echo
echo "---------------------------------------------------------------"
echo " BUILD KERNEL (PASS TWO - MODULES)"
echo "---------------------------------------------------------------"
echo

# STRIP
STRIP=${TOOLCHAIN}/${TOOLCHAIN_PREFIX}strip

# MODULEBINDIR
MODULEBINDIR=$BINDIR/modules

if [ ! -d "$BINDIR" ]; then
	mkdir $BINDIR
fi
if [ ! -d "$MODULEBINDIR" ]; then
	mkdir $MODULEBINDIR
fi

# MAKE must be executed from the src/kernel directory
pushd $SRCDIR/kernel > /dev/null
make CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX ARCH=arm modules
popd > /dev/null

if [[ $? -ne 0 ]]; then
	exit -1
fi

exit
