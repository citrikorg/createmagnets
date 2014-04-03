#!/bin/bash

# Code from 44Kbps
# Thanks for the inspitation and the some code @ioerror
# Thanks to Jimmics for the $(command)

# Necessary package: rhash https://github.com/rhash/RHash

# rhash Usage: 
# 1) Direct Connect TTH and EDonkey200: rhash --magnet files
# 2) Magnet link for Bitorrent P2P Bittorrent Info Hash (BTIH): rhash --magnet --btih files 
# 3) All supported magnet Hash: rhash -ma files

### Bugs-Features
# 1) More Trackers

###TESTED ON rTorret CLIENT, OPTION 3) and 1) NOT WORKING, WRONG URL

TRACKERS="udp://tracker.openbittorrent.com:80/announce,udp://tracker.publicbt.com:80/announce,http://tracker.openbittorrent.com:80/announce,http://tracker.publicbt.com:80/announce,udp://tracker.ccc.de/announce"
ARRAY_TRACK=(${TRACKERS//,/ })

echo $ARRAY_TRACK

SOURCE=/public/
DEST_FILE=/public/magnets.url
OPTS="-r --magnet --btih --percents --speed"

# Recursive file on SOURCE
cd $SOURCE
for file in `find . -type f`
do
 path=${file%/*}
 path=${path#.}
 name=${file##*/}

 echo Processing $path/$file
 echo -n $(/usr/bin/rhash $OPTS $file) >> $DEST_FILE
 for i in "${!ARRAY_TRACK[@]}"
  do
   echo -n "&tr=${ARRAY_TRACK[i]}" >> $DEST_FILE
  done
  echo "" >> $DEST_FILE
done
