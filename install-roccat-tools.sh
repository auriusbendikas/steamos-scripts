#!/bin/bash -e

if [ "$EUID" -ne 0 ]; then
    echo "Error: Script must be executed as root."
    exit -1
fi

LIBGAMINGGEAR_URL='https://downloads.sourceforge.net/project/libgaminggear/libgaminggear-0.15.1.tar.bz2'
LIBGAMINGGEAR_FILE=$(basename $LIBGAMINGGEAR_URL)
LIBGAMINGGEAR_DIR=$(basename $LIBGAMINGGEAR_URL .tar.bz2)
ROCCAT_TOOLS_URL='https://downloads.sourceforge.net/project/roccat/roccat-tools/roccat-tools-5.7.0.tar.bz2'

apt-get -y --no-install-recommends install libcanberra-dev libgtk2.0-dev libgudev-1.0-dev libnotify-dev gettext

mkdir -p target
cd target
wget -O $LIBGAMINGGEAR_FILE $LIBGAMINGGEAR_URL
tar -xf $LIBGAMINGGEAR_FILE
cd $LIBGAMINGGEAR_DIR
mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
make

apt-get -y --purge --auto-remove remove libcanberra-dev libgtk2.0-dev libgudev-1.0-dev libnotify-dev gettext
#apt-get -y clean
