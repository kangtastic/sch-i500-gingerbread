#!/bin/bash

echo
echo "---------------------------------------------------------------"
echo " BUILD KERNEL"
echo "---------------------------------------------------------------"
echo

# STRIP
STRIP=${TOOLCHAIN}/${TOOLCHAIN_PREFIX}strip

# RAMDISKBINDIR
export RAMDISKBINDIR=$BINDIR/ramdisk

# KERNELBINDIR
KERNELBINDIR=$BINDIR/kernel

# Create output directories as required
if [ ! -d "$BINDIR" ]; then
	mkdir $BINDIR
fi

if [ ! -d "$KERNELBINDIR" ]; then
	mkdir $KERNELBINDIR
fi

# MAKE KERNEL (PASS 1 - CONFIG)
pushd $SRCDIR/kernel > /dev/null
make CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX ARCH=arm sch-i500_defconfig
popd > /dev/null

if [[ $? -ne 0 ]]; then
	exit -1
fi

# MAKE KERNEL (PASS 2 - MODULES)
pushd $SRCDIR/kernel > /dev/null
make CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX ARCH=arm modules
popd > /dev/null

if [[ $? -ne 0 ]]; then
	exit -1
fi

# Copy generated kernel modules into ramdisk and strip symbols
pushd $SRCDIR/kernel > /dev/null
for line in `cat modules.order`
do 
	echo ${line:7}
	cp ${line:7} $RAMDISKBINDIR/lib/modules/
	$STRIP --strip-debug $RAMDISKBINDIR/lib/modules/$(basename $line)
done
popd > /dev/null

# MAKE KERNEL (PASS 3 - BUILD)
pushd $SRCDIR/kernel > /dev/null
make CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX ARCH=arm
popd > /dev/null

if [[ $? -ne 0 ]]; then
	exit -1
fi

# Copy generated kernel modules into intermediate folder
cp $SRCDIR/kernel/arch/arm/boot/zImage $KERNELBINDIR

exit
