#!/bin/bash -e

if [ "$EUID" -ne 0 ]; then
    echo "Error: Script must be executed as root."
    exit -1
fi

apt-get -y --no-install-recommends install checkinstall cmake
