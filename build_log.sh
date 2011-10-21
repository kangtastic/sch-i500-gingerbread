#!/bin/bash
DATE=$(date +%m%d)
TIME=$(date +%H%M)
bash build.sh clean 2>&1 | tee TKSGB-I500-"$DATE.$TIME".buildlog.txt
