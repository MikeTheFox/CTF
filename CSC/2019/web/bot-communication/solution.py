#!/usr/bin/python

import base64
 
data = bytearray(base64.b64decode('AGMFPSYkJ1IkdSFwcgh0c3ZxJgB/c3JxIgciI3x2dgB/InMjewQiJXJycAh1cSN9JVEjIHZ1cAF0fnBwd1R/dXAgIlQ7'))
key = bytearray("C0FFEE")
print(bytearray(((data[i] ^ key[i % len(key)]) for i in range(0, len(data)))))
