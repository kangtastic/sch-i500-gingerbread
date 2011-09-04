#!/bin/bash

# OPTIONAL SCRIPT ARGUMENTS:
#
# fast		- Perform a fast build, which only cleans the OUT folder

echo
echo "---------------------------------------------------------------"
echo " CLEAN"
echo "---------------------------------------------------------------"
echo

# Clean Intermediate files
if [ ! "$1" = "fast" ]; then 
	if [ -d "$BINDIR" ]; then
		rm -f -r $BINDIR
	fi
fi

# Clean Output files
if [ -d "$OUTDIR" ]; then
	rm -f -r $OUTDIR
fi

# Clean the KERNEL
if [ ! "$1" = "fast" ]; then 
	pushd $SRCDIR/kernel > /dev/null
	make CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX clean mrproper
	popd > /dev/null

	if [[ $? -ne 0 ]]; then
		exit -1
	fi
fi

exit

