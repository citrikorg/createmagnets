#!/bin/bash

### Create recursive magnets URLs on a directory with rhash package

# http://sourceforge.net/apps/mediawiki/rhash/index.php?title=Usage_examples
# http://earthwithsun.com/questions/628152/create-and-seed-a-torrent-from-scratch-via-magnet

# Necessary package: rhash https://github.com/rhash/RHash

# Usage: 
# 1) Direct Connect TTH and EDonkey200: rhash --magnet files
# 2) Magnet link for Bitorrent P2P Bittorrent Info Hash (BTIH): rhash --magnet --btih files 
# 3) All supported magnet Hash: rhash -ma files

###TESTING ON rTorret CLIENT, OPTION 3) and 1) NOT WORKING, WRONG URL
###!!!NEED TRACKERS!!!

TRACK1=udp://tracker.openbittorrent.com:80/announce
TRACK2=udp://tracker.publicbt.com:80/announce
TRACK3=http://tracker.openbittorrent.com:80/announce
TRACK4=http://tracker.publicbt.com:80/announce
TRACK5=udp://tracker.ccc.de/announce

SOURCE="/public/"
DEST_FILE="/public/magnets.url"
OPTS="-r --magnet --btih --percents --speed"

# Recursive file on SOURCE
cd $SOURCE
for file in `find . -type f`
do
 path=${file%/*}
 path=${path#.}
 name=${file##*/}

 echo Processing $path/$file
 /usr/bin/rhash $OPTS $file > $DEST_FILE
done

