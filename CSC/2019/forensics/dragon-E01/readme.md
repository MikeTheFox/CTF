# Dragon-E01

## Challenge

> We discovered a rogue device in our datacenter, our forensics team already created an image but can't seem to find the secret. Can you help?
>
> [Download files](Dragon.E01)
>
> Flag format: CSC{&lt;string&gt;}

## Solution

* First mount the 'Encase' file

```
# mkdir raw
# ewfmount Dragon.E01 ./raw/
# mkdir mountpoint
# mount ./raw/ewf1 ./mountpoint -o ro,loop,show_sys_files,streams_interface=windows
```

* Now it is possible to examine the contents of the folder. This reveals alternate data streams.

```
# cd mountpoint/
# getfattr -R -n ntfs.streams.list ./
# getfattr -R -n ntfs.streams.list wallpaper.jpg 
```

* The contents of the alternate data stream reveals the flag.

`# cat wallpaper.jpg:data.txt`

