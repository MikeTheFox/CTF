
# The ancient writings 2 (60)

## Challenge

> When Mr. Blanche, the cleaning man, cleaned out the house of Dr XX he found another piece of paper containing a printout similar to the one of the easy challenge.
> You're again called in as you've proven yourself to be an expert in Medieval programming languages.
> Looking at the code you see that it must be an earlier version of the code.
> Unfortunately, one line is missing. Can you find this line ?
> 
> 52.210.193.145:4242
> 
> [technical_documentation.txt](technical_documentation.txt)
>
> Flag format: CSC{&lt;string&gt;}

## Solution

* First half has a difference `47+:*2+v` vs `47+:*2+vv`

```
<>47+:*1+                                        47+:*2+vv"   >^
<>47+:*1+                                     47+:*2+v    "   >^
```

* Change next line so it has the same result as in the first "ancient-writing" challenge

* Line:
```
v                                                    <   <    ^<
```

* Result: 
```
>232+*""43*52**5+65+:*4::**3:*21+:** "b"$                 v    >
^"78"v $  $ \ $ \ $<"x32P"    _                           "    v
^|%24<"SC{key_Y3ByZXNzZXk=}"  ^7        *:+33 +*27*7 *44"key"  <
<>47+:*1+                                     47+:*2+v    "   >^
v                                                    <   <    ^<
>                                        >    34*9g"SC":vv     ^            
<                                                    v:,_@>"#_"^
>                                                    >  ^      <

0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZv^<>0123456789abcdefghijklmnopqrstuvwxyz
```

* Encode the uri and go to the website as described in technical_documentation 

```
encodeURI("v                                                    <   <    ^<")
```
