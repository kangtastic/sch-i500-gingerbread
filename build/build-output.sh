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

# Edify Update ZIP
cp -r $REFDIR/update-zip $OUTDIR/update-zip
cp $KERNELBINDIR/zImage $OUTDIR/update-zip/kernel_update/
# Put $DATE value into updater-script
pushd $OUTDIR/update-zip/META-INF/com/google/android > /dev/null
sed _\$DATE_$DATE <updater-script >updater-script.tmp
mv -f updater-script.tmp updater-script
popd > /dev/null
pushd $OUTDIR/update-zip
zip -r -q TKSGB-EH09-"$DATE.$TIME".zip .
mv TKSGB-EH09-"$DATE.$TIME".zip $OUTDIR/
popd > /dev/null

# ODIN tarball
cp $KERNELBINDIR/zImage $OUTDIR/
cp $OUTDIR/zImage $OUTDIR/recovery.bin
pushd $OUTDIR > /dev/null
tar --format=ustar -cf TKSGB-EH09-"$DATE.$TIME".tar zImage
md5sum -t TKSGB-EH09-"$DATE.$TIME".tar >> TKSGB-EH09-"$DATE.$TIME".tar
mv TKSGB-EH09-"$DATE.$TIME".tar TKSGB-EH09-"$DATE.$TIME".tar.md5
# Another with no $TIME in filename for releases
tar --format=ustar -cf TKSGB-EH09-"$DATE".tar zImage
md5sum -t TKSGB-EH09-"$DATE".tar >> TKSGB-EH09-"$DATE".tar
mv TKSGB-EH09-"$DATE".tar TKSGB-EH09-"$DATE".tar.md5

# leave the output files in place for heimdall for now
#rm -f recovery.bin
#rm -f zImage

popd > /dev/null

#TODO: list outputs

