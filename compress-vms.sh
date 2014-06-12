#!/bin/bash
#
# compresses each directory in /Users/username/VirtualBox VMs/ into its own 7z archive
# NOTE: tested on OSX Mavericks, should work on linux


# TODO iterate over directories in vmDir, excluding backupDir

# NOTE: 20s with compression 0 (store)


compression=0

baseDir=`pwd`
timeStamp=`date +"%Y%m%d_%H%M"`

vmDir="$HOME/VirtualBox VMs"
backupDir=$vmDir/backups


cd "$vmDir"

mkdir "$backupDir"

7z a -mx=$compression -xr@$baseDir/exclude-from-backup.txt "$backupDir/debian-5-$timeStamp-compression-$compression.7z" "$vmDir/Debian 5 (Lenny) server 64bit"
7z a -mx=$compression -xr@$baseDir/exclude-from-backup.txt "$backupDir/debian-6-$timeStamp-compression-$compression.7z" "$vmDir/Debian 6 (Squeeze) server 64bit"
7z a -mx=$compression -xr@$baseDir/exclude-from-backup.txt "$backupDir/debian-7-$timeStamp-compression-$compression.7z" "$vmDir/Debian 7 (Wheezy) server 64bit"
7z a -mx=$compression -xr@$baseDir/exclude-from-backup.txt "$backupDir/debian-sid-$timeStamp-compression-$compression.7z" "$vmDir/Debian Unstable (sid) server 64bit"

cd "$baseDir"
