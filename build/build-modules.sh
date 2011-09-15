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

# Copy generated kernel modules into intermediate folder
cp $SRCDIR/kernel/crypto/ansi_cprng.ko $MODULEBINDIR
cp $SRCDIR/kernel/drivers/misc/param/param.ko $MODULEBINDIR
cp $SRCDIR/kernel/drivers/misc/vibetonz/vibrator.ko $MODULEBINDIR
cp $SRCDIR/kernel/drivers/onedram/dpram/dpram_atlas.ko $MODULEBINDIR
cp $SRCDIR/kernel/drivers/onedram/dpram_recovery/dpram_recovery.ko $MODULEBINDIR
cp $SRCDIR/kernel/drivers/scsi/scsi_wait_scan.ko $MODULEBINDIR
cp $SRCDIR/kernel/net/sched/cls_flow.ko $MODULEBINDIR

# Strip symbols from generated binaries
$STRIP --strip-debug $MODULEBINDIR/ansi_cprng.ko
$STRIP --strip-debug $MODULEBINDIR/param.ko
$STRIP --strip-debug $MODULEBINDIR/vibrator.ko
$STRIP --strip-debug $MODULEBINDIR/dpram_atlas.ko
$STRIP --strip-debug $MODULEBINDIR/dpram_recovery.ko
$STRIP --strip-debug $MODULEBINDIR/scsi_wait_scan.ko
$STRIP --strip-debug $MODULEBINDIR/cls_flow.ko

exit
