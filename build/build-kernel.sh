#!/bin/bash

echo
echo "---------------------------------------------------------------"
echo " BUILD KERNEL (PASS THREE - ZIMAGE)"
echo "---------------------------------------------------------------"
echo

# KERNELBINDIR
KERNELBINDIR=$BINDIR/kernel

if [ ! -d "$BINDIR" ]; then
	mkdir $BINDIR
fi
if [ ! -d "$KERNELBINDIR" ]; then
	mkdir $KERNELBINDIR
fi

# MAKE must be executed from the src/kernel directory
pushd $SRCDIR/kernel > /dev/null
make -j8 CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX ARCH=arm 
popd > /dev/null

if [[ $? -ne 0 ]]; then
	exit -1
fi

# Copy generated kernel modules into intermediate folder
cp $SRCDIR/kernel/arch/arm/boot/zImage $KERNELBINDIR

exit
