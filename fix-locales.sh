#!/bin/bash -e

if [ "$EUID" -ne 0 ]; then
    echo "Error: Script must be executed as root."
    exit -1
fi

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
dpkg-reconfigure --frontend=noninteractive locales
localectl set-locale LANGUAGE="en_US.UTF-8"
localectl set-locale LC_ALL="en_US.UTF-8"
localectl set-locale LANG="en_US.UTF-8"

echo "Please reboot for changes to take effect"
