#!/bin/bash
#
##setup command=wget https://raw.githubusercontent.com/tarekzoka/os-e2player/main/e2player.sh-O - | /bin/sh
#
echo "==============================================="
echo "       Download And Install Plugin e2player     "
echo "==============================================="

TEMPATH="/tmp"
    dpkg -i --force-overwrite $MY_DEB
MY_DEB="enigma2-plugin-extensions-iptvplayer_v1.0_all.deb"
MY_URL="https://raw.githubusercontent.com/tarekzoka/os-e2player/main" 
# Detect system type
if [ -f /etc/apt/apt.conf ]; then
    STATUS='/var/lib/dpkg/status'
    OS='DreamOS'
elif [ -f /etc/opkg/opkg.conf ]; then
    STATUS='/var/lib/opkg/status'
    OS='Opensource'
else
    echo "❌ Unknown OS type"
    exit 1
fi

echo "==> Removing old version..."
opkg remove enigma2-plugin-extensions-estalker > /dev/null 2>&1
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/EStalker
echo ""

cd $TEMPATH || exit 1
set -e

# Download and install the correct package
if which dpkg > /dev/null 2>&1; then
    wget -q "$MY_URL/$MY_DEB"
    dpkg -i --force-overwrite $MY_DEB
    apt-get install -f -y
    rm -f $MY_DEB
else
    wget -q "$MY_URL/$MY_IPK"
    $OPKGINSTALL $MY_IPK
    rm -f $MY_IPK
fi

echo "==============================================="
echo "✅ Plugin estalker installed successfully"
echo "==============================================="
set +e

echo ""
echo "************************************************"
echo "   UPLOADED BY  >>>>   TAREK_HANFY              "
echo "************************************************"
sleep 4

echo ""
echo "################################################"
echo "#         Restarting Enigma2 GUI              #"
echo "################################################"
sleep 2

if [ "$OS" = "DreamOS" ]; then
    systemctl restart enigma2
else
    killall -9 enigma2
fi

exit 0


