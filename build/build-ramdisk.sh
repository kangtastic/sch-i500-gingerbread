#!/bin/bash

echo
echo "---------------------------------------------------------------"
echo " BUILD RAMDISK IMAGE"
echo "---------------------------------------------------------------"
echo

# RAMDISKREFDIR
RAMDISKREFDIR=$REFDIR/ramdisk

# RAMDISKSRCDIR
RAMDISKSRCDIR=$SRCDIR/ramdisk

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

# Remove unwanted files from the ramdisk image
rm -f $RAMDISKBINDIR/lib/modules/hotspot_event_monitoring.ko

# Copy modified versions of the ramdisk files into the output directory
cp -R $RAMDISKSRCDIR/* $RAMDISKBINDIR/

# Create kernel version tag in ramdisk root
echo "TKSGB-EH09-$DATE.$TIME" > $RAMDISKBINDIR/kernel_version
exit

