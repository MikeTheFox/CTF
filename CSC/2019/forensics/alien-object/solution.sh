#!/usr/bin/bash

exiftool -s -Model cosmos.jpg | cut -d":" -f2 | awk '{$1=$1;print}' | base64 -d > cosmos.zip
unzip -p cosmos.zip f
rm cosmos.zip
echo ""

