#!/bin/bash

echo
echo "---------------------------------------------------------------"
echo " BUILD RAMDISK IMAGE"
echo "---------------------------------------------------------------"
echo

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

exit
