#!/bin/sh

#wget https://raw.githubusercontent.com/tarekzoka/os-e2player/main/e2player.sh-O - | /bin/sh

##########################################
version=000
#############################################################
TEMPATH=/tmp
OPKGINSTALL="opkg install --force-reinstall"
MY_IPK="enigma2-plugin-extensions-iptvplayer_v1.0_all.ipk"
MY_DEB="enigma2-plugin-extensions-iptvplayer_v1.0_all.deb"
MY_URL="https://gitlab.com/hanfy1971/plugin/-/raw/main/os-e2player"
# remove old version #
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/IPTVPlayer

echo ""
# Download and install plugin
cd /tmp
set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
	else
		$OPKGINSTALL $MY_IPK
	fi
echo "================================="
set +e
cd ..
wait
rm -f /tmp/*.ipk
rm -f /tmp/*.deb
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi
wait
wget -O /etc/tsiplayer_xtream.conf https://raw.githubusercontent.com/tarekzoka/os-e2player/main/tsiplayer_xtream.conf   
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   TARK_HANFY "   
sleep 4;
		echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0





