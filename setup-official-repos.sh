#!/bin/bash -e

if [ "$EUID" -ne 0 ]; then
    echo "Error: Script must be executed as root."
    exit -1
fi

cat > /etc/apt/sources.list.d/official-repo.list << EOF
deb ftp://ftp.se.debian.org/debian/ jessie main contrib non-free
deb-src ftp://ftp.se.debian.org/debian/ jessie main contrib non-free
EOF

cat > /etc/apt/preferences.d/steamos.pref << EOF
Package: *
Pin: release o=Valve Software LLC
Pin-Priority: 900

Package: *
Pin: release l=Debian
Pin-Priority: 110
EOF

apt-get update -y
