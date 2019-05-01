
# Bot communication

## Challenge

> You found a malicious server that looks to serve content via HTTP requests. When you visit the website, you receive an error message. Will you successfully interact with the server?
>
> 99.80.109.60:8080
>
> Flag format: CSC{<string>}

## Solution

Opening the site in a browser shows a message "Invalid command" with a base64 string. Decoding this base64 string revealed the "User-Agent" field of the http request. 

Sending a HTTP request with "HELP" base64 encoded as User-Agent gave a list of commands. 

* HELP 

> `wget --user-agent="$(echo -n "HELP" | base64)" -O - http://99.80.109.60:8080 2>/dev/null`
> Please submit a command: PING, ECHO, TOKEN, KEY, HELP

* PING 

> `wget --user-agent="$(echo -n "PING" | base64)" -O - http://99.80.109.60:8080 2>/dev/null`
> PONG!

* ECHO

> `wget --user-agent="$(echo -n "ECHO" | base64) Hello bot..." -O - http://99.80.109.60:8080 2>/dev/null`
> Hello bot...

* TOKEN

> `wget --user-agent="$(echo -n "TOKEN" | base64)" -O - http://99.80.109.60:8080 2>/dev/null | base64 -w 0`
> AGMFPSYkJ1IkdSFwcgh0c3ZxJgB/c3JxIgciI3x2dgB/InMjewQiJXJycAh1cSN9JVEjIHZ1cAF0fnBwd1R/dXAgIlQ7

* KEY 

> `wget --user-agent="$(echo -n "KEY" | base64)" -O - http://99.80.109.60:8080 2>/dev/null`
> C0FFEE

There was a key and token command. Decrypting the token with this key revealed the solution...

```python

import base64
 
data = bytearray(base64.b64decode('AGMFPSYkJ1IkdSFwcgh0c3ZxJgB/c3JxIgciI3x2dgB/InMjewQiJXJycAh1cSN9JVEjIHZ1cAF0fnBwd1R/dXAgIlQ7'))
key = bytearray("C0FFEE")
print(bytearray(((data[i] ^ key[i % len(key)]) for i in range(0, len(data)))))

```
