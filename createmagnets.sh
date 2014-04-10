# createmagnets.sh v0.2b GPLv3 by 44Kbps

# This version is only one command line
# TODO: more trackers!

TRACKERS="&tr=udp://tracker.openbittorrent.com:80/announce,&tr=udp://tracker.publicbt.com:80/announce,&tr=http://tracker.openbittorrent.com:80/announce,&tr=http://tracker.publicbt.com:80/announce,&tr=udp://tracker.ccc.de/announce"

SOURCE=/public/
MAGNETS=/public/magnets.url
OPTS="-r --magnet --btih --percents --speed"

# Recursive file on SOURCE with find
find /public/ -type f -exec /usr/bin/rhash $OPTS {} \; -exec echo $TRACKERS  \; > $MAGNETS
