
# Base64 + xor = <3 (80)

## Challenge

> I found a way to thwart people breaking xor encryption! Instead of base64 encoding the encrypted message, I'll first encode the message before encrypting it. No more frequency analysis! Anyway, here is the method I used, It's so simple I'm surprised nobody thought about it before. Unbreakable!
> 
> base64 -w 0 message.txt | xortool-xor -s <notthekey> -f - > message.enc
>
> You can find the encrypted message on the following link:
>
> Flag format: CSC{<string>}

## Solution 


* Use [xortool](https://github.com/hellman/xortool) for analysis

```
] python xortool -l 23 -o ..\..\message.enc
100 possible key(s) of length 23:
1\r"\x01\x13\x12\x00\'#9O\x10\x1c\x16\x1f"C!\x04E\'\x00\x13
0\x0c#\x00\x12\x13\x01&"8N\x11\x1d\x17\x1e#B \x05D&\x01\x12
3\x0f \x03\x11\x10\x02%!;M\x12\x1e\x14\x1d A#\x06G%\x02\x11
2\x0e!\x02\x10\x11\x03$ :L\x13\x1f\x15\x1c!@"\x07F$\x03\x10
5\t&\x05\x17\x16\x04#'=K\x14\x18\x12\x1b&G%\x00A#\x04\x17
...
Found 33 plaintexts with 95.0%+ printable characters
See files filename-key.csv, filename-char_used-perc_printable.csv
```

> (42: The answer to life, the universe and everything)

* filename-key.csv
	* xortool_out\42.out;FzUvdewPTN8gkahU4Vs2Pwd

* filename-char_used-perc_printable.csv
	* xortool_out\42.out;71;100.0

Note: 42.out has a bad '>' character in the end, remove it.

* `base64 --decode 42.out > message.txt`

* `cat message.txt | less`
