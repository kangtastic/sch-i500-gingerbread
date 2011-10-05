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
zip -r -q TKSGB-EH09-"$DATE.$TIME".zip .
mv TKSGB-EH09-"$DATE.$TIME".zip $OUTDIR/
rm -f ./kernel_update/zImage
popd > /dev/null

# ODIN tarball
cp $KERNELBINDIR/zImage $OUTDIR/
cp $OUTDIR/zImage $OUTDIR/recovery.bin
pushd $OUTDIR > /dev/null
tar --format=ustar -cf TKSGB-EH09-"$DATE.$TIME".tar zImage
md5sum -t TKSGB-EH09-"$DATE.$TIME".tar >> TKSGB-EH09-"$DATE.$TIME".tar
mv TKSGB-EH09-"$DATE.$TIME".tar TKSGB-EH09-"$DATE.$TIME".tar.md5

# leave the output files in place for heimdall for now
#rm -f recovery.bin
#rm -f zImage

popd > /dev/null

#TODO: list outputs

