#!/bin/bash

echo
echo "---------------------------------------------------------------"
echo " BUILD OUTPUT"
echo "---------------------------------------------------------------"
echo

# KERNELBINDIR
KERNELBINDIR=$BINDIR/kernel

if [ ! -d "$OUTDIR" ]; then
	mkdir $OUTDIR
fi

#TODO: clean up and move work into out or bin; don't work in REF

# Edify Update ZIP
cp $KERNELBINDIR/zImage $REFDIR/update-zip/kernel_update/
pushd $REFDIR/update-zip > /dev/null
zip -r -q sch-i500-kernel.zip .
mv sch-i500-kernel.zip $OUTDIR/
rm -f ./kernel_update/zImage
popd > /dev/null

# ODIN tarball
cp $KERNELBINDIR/zImage $OUTDIR/
cp $OUTDIR/zImage $OUTDIR/recovery.bin
pushd $OUTDIR > /dev/null
tar --format=ustar -cf sch-i500-kernel.tar recovery.bin zImage
md5sum -t sch-i500-kernel.tar >> sch-i500-kernel.tar
mv sch-i500-kernel.tar sch-i500-kernel.tar.md5

# leave the output files in place for heimdall for now
#rm -f recovery.bin
#rm -f zImage

popd > /dev/null

#TODO: list outputs

