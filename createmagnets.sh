#!/bin/bash

### Create recursive magnets URLs on a directory with rhash package

# http://sourceforge.net/apps/mediawiki/rhash/index.php?title=Usage_examples

# Necessary package: rhash https://github.com/rhash/RHash

# Usage: 
# 1) Direct Connect TTH and EDonkey200: rhash --magnet files
# 2) Magnet link for Bitorrent P2P Bittorrent Info Hash (BTIH): rhash --magnet --btih files 
# 3) All supported magnet Hash: rhash -ma files

###TESTING ON rTorret CLIENT, OPTION 3) and 1) NOT WORKING, WRONG URL
###!!!NEED TRACKERS!!!

SOURCE="/var/public/"
DEST_FILE="/var/public/magnets.url"
OPTS="-r --magnet --btih --percents --speed"

/usr/bin/rhash $OPTS $SOURCE > $DEST_FILE

