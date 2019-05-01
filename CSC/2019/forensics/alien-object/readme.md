
# Alien Object (30)

## Challenge

> NASA requested your assistance in identifying this Alien Object.
> 
> [Download files](cosmos.jpg)
> 
> Flag format: CSR{<string>}

## Solution

Using exiftool there is a base 64 string in the value of the 'Camera Model Name' property. The content is binary data starting with a 'PK' header, which indicates this is a zip file. Unzipping that file reveals another file 'f' with the flag.

```
# exiftool -s -Model cosmos.jpg | cut -d":" -f2 | awk '{$1=$1;print}' | base64 -d > cosmos.zip
# unzip cosmos.zip
# cat f
# rm f
# rm cosmos.zip
```

Or

`# exiftool -s -Model cosmos.jpg | cut -d":" -f2 | awk '{$1=$1;print}' | base64 -d > cosmos.zip ; unzip -p cosmos.zip f ; rm cosmos.zip`
