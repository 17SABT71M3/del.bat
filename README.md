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
White lists on the other hand disallow file deletion.
