U can replace the `DEL` command by a combination using the `DOSKEY` macro and updating<br>
the registry key `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor`<br>
and adding a string (`AutoRun`) containing path of the doskey macro named 

This is What my AutoRun file looks like
```
@echo off

doskey del="c:\users\anl bfppa\desktop\del.bat" $*
doskey notepad="c:\users\anl bfppa\desktop\notepad.bat" $*
```
Update: Added support for Whitelists (whitelist.txt) and Blacklists (blacklist.txt)
Black lists cut thru the chase when there is no problem deleting a file. You are
still prompted.
White lists on the other hand strike down file deletion.
<br>Example Usage- ```whitelist.bat .\something.png```

Added Features
<br>You can now hide blacklist.txt using attrib +h command

Additional Features/Suggestions to think thru-
<br>Move Files to temporary folder instead of delete
<br>Mechanism to Lockdown del.bat Write/Delete

