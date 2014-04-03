#!/bin/bash

### Create recursive magnets URLs on a directory with rhash package

###TESTING ON rTorret CLIENT, NOT WORKING, WRONG URL

# http://sourceforge.net/apps/mediawiki/rhash/index.php?title=Usage_examples

# Necessary package: rhash https://github.com/rhash/RHash

# Usage: 
# 1) Direct Connect TTH and EDonkey200: rhash --magnet files
# 2) Magnet link for Bitorrent P2P Bittorrent Info Hash (BTIH): rhash --magnet --btih files 
# 3) All supported magnet Hash: rhash -ma files

### Used -ma option: rhash -ma files (More Hashes files)

SOURCE="/var/public/"
DEST_FILE="/var/public/magnets.url"
OPTS="-r -ma  --percents --speed"

/usr/bin/rhash $OPTS $SOURCE > $DEST_FILE

