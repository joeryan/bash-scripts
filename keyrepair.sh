#!/bin/bash

# keyrepair.sh
# Repairs bad keys in apt keystore
# run as sudo for access to apt-get functions

# clean?
apt-get clean

# set /var/lib/apt as working directory and move the lists directory
cd /var/lib/apt
mv lists lists.old

# create new, empty lists/partial directory
mkdir -p lists/partial

# clean? then update apt cache
apt-get clean
apt-get update


