#!/bin/bas
#
# Command: wget -q "--no-check-certificate" https://raw.githubusercontent.com/tarekzoka/os-e2player/refs/heads/main/e2player.sh -O - | /bin/sh #
 wget -O /tmp/e2plyaer.tar.gz "https://raw.githubusercontent.com/tarekzoka/os-e2player /main/e2player.tar.gz"

tar -xzf /tmp/*.tar.gz -C /

rm -r /tmp/e2player.tar.gz

killall -9 enigma2

sleep 2;
