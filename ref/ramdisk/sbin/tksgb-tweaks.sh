#!/system/bin/sh

# Remount /system rw
busybox mount -o remount,rw /
busybox mount -o remount,rw /system

# Fix up resolv.conf with multicasted Verizon and Google DNS
if [ ! -f "/system/etc/resolv.conf" ]; then
	echo "nameserver 4.2.2.4" >> /system/etc/resolv.conf
	echo "nameserver 8.8.4.4" >> /system/etc/resolv.conf
fi
sync

# Set SD Card read_ahead_kb value
if [ -e /sys/devices/virtual/bdi/179:0/read_ahead_kb ]; then
	echo "1024" > /sys/devices/virtual/bdi/179:0/read_ahead_kb
fi

# Install liblights
busybox cp -f /res/liblights/lights.s5pc110.so /system/lib/hw/lights.s5pc110.so
busybox chown root.root /system/lib/hw/lights.s5pc110.so
busybox chmod 0644 /system/lib/hw/lights.s5pc110.so

# Install bootanimation binary
busybox cp -f /res/bootanimation /system/bin/bootanimation
busybox chown root.shell /system/bin/bootanimation
busybox chmod 0755 /system/bin/bootanimation

# Bootanimation hack
while [ 1 ]; do
	sleep 1;
	if pgrep android.process.acore; then
		sleep 5;
		busybox pkill bootanimation
		busybox pkill samsungani
		exit;
	fi
done
