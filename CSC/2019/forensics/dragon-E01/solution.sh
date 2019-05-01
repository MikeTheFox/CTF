#!/bin/bash

mkdir raw
ewfmount Dragon.E01 ./raw/

mkdir mountpoint
mount ./raw/ewf1 ./mountpoint -o ro,loop,show_sys_files,streams_interface=windows

getfattr -R -n ntfs.streams.list mountpoint/wallpaper.jpg 
cat mountpoint/wallpaper.jpg:data.txt

umount mountpoint
rmdir mountpoint

umount raw
rmdir raw
