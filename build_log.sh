DATE=$(date +%m%d)
TIME=$(date +%H%M)
bash build.sh clean 2>&1 | tee TKSGB-EH09-"$DATE.$TIME".buildlog.txt
