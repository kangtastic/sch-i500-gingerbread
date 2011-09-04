#!/bin/bash

echo
echo "---------------------------------------------------------------"
echo " BUILD KERNEL (PASS ONE - CONFIG)"
echo "---------------------------------------------------------------"
echo

# MAKE must be executed from the src/kernel directory
pushd $SRCDIR/kernel > /dev/null
make CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX ARCH=arm sch-i500_defconfig
popd > /dev/null

if [[ $? -ne 0 ]]; then
	exit -1
fi

exit

