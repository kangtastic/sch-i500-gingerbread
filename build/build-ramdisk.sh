#!/bin/bash

echo
echo "---------------------------------------------------------------"
echo " BUILD RAMDISK IMAGE"
echo "---------------------------------------------------------------"
echo

# MODULEBINDIR
MODULEBINDIR=$BINDIR/modules

# RAMDISKREFDIR
RAMDISKREFDIR=$REFDIR/ramdisk

# RAMDISKBINDIR
export RAMDISKBINDIR=$BINDIR/ramdisk

if [ ! -d "$BINDIR" ]; then
	mkdir $BINDIR
fi
if [ ! -d "$RAMDISKBINDIR" ]; then
	mkdir $RAMDISKBINDIR
fi

# Copy the reference ramdisk into the output directory
cp -R $RAMDISKREFDIR/* $RAMDISKBINDIR/

# MODULES --> RAMDISK
cp $MODULEBINDIR/ansi_cprng.ko $RAMDISKBINDIR/lib/modules/
cp $MODULEBINDIR/cls_flow.ko $RAMDISKBINDIR/lib/modules/
cp $MODULEBINDIR/param.ko $RAMDISKBINDIR/lib/modules/
cp $MODULEBINDIR/scsi_wait_scan.ko $RAMDISKBINDIR/lib/modules/
cp $MODULEBINDIR/vibrator.ko $RAMDISKBINDIR/lib/modules/

exit
