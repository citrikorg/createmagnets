# createmagnets.sh v0.1b GPLv3 by 44Kbps

TRACKERS="udp://tracker.openbittorrent.com:80/announce,udp://tracker.publicbt.com:80/announce,http://tracker.openbittorrent.com:80/announce,http://tracker.publicbt.com:80/announce,udp://tracker.ccc.de/announce"
ARRAY_TRACK=(${TRACKERS//,/ })

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
