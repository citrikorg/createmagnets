createmagnets
=============

Java and Bash script (not working good)  to create magnet URL of several using rhash
Updated to java

Thanks for the inspitation and the some code @ioerror,
Thanks to Jimics for the $(command)

Necessary package: rhash https://github.com/rhash/RHash

rhash Usage: 
1) Direct Connect TTH and EDonkey200: rhash --magnet files
2) Magnet link for Bitorrent P2P Bittorrent Info Hash (BTIH): rhash --magnet --btih files 
3) All supported magnet Hash: rhash -ma files

Bugs-Features
1) More Trackers
2) Problem with files and directories with space (only on bash, unresolved)

TESTED ON rTorret CLIENT, OPTION 3) and 1) NOT WORKING, WRONG URL
