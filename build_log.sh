DATE=$(date +%m%d)
TIME=$(date +%H%M)
bash build.sh clean 2>&1 | tee tks-buildlog-"$DATE.$TIME".txt
