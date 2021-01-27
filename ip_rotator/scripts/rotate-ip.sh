#!/bin/bash
PID=$(/bin/ps axu | /bin/grep openvpn | /usr/bin/awk '{print $2}' | /usr/bin/head -1)
kill $PID
while kill -0 $PID; do 
    sleep 1
done
/usr/sbin/openvpn --config /home/vpn_config/conn/$(ls /home/vpn_config/conn | /usr/bin/sort -R | /usr/bin/tail -1) --auth-user-pass /home/vpn_config/creds.txt
