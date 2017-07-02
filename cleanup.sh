#!/bin/bash -e

if [ "$EUID" -ne 0 ]; then
    echo "Error: Script must be executed as root."
    exit -1
fi

apt-get -y --purge --auto-remove remove checkinstall cmake dpkg-dev libdpkg-perl libtimedate-perl

rm -rf target
