#!/bin/bash

OLDIFS=$IFS
IFS=$'\n'

# find out which keys are invalid or missing
lines=`sudo apt-get update 2>&1 | grep "BADSIG"`

# for each line that has a bad public key
for line in $lines
do

    # for each line - get signature? of missing key
    # signature is one blank space after BADSIG
    key=`echo $line | tail --bytes=17` # BADSIG + 7?
   
    # get appropriate key from keyserver
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
   
    # mark that we got some keys
    SOMETHINGDONE="true"
   
done

# return original IFS
IFS=$OLDIFS

# Update if we actually got new keys
if [ $SOMETHINGDONE ]
then
    sudo apt-get update
fi

