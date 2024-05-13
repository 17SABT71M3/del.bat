Just a short note: 66<br>
<p align="center">[<img src="DEL.BAT.png" height=100>](https://github.com/17SABT71M3/del_.bat/blob/832c94654edf0bb9da2f884aa495741c163d6a15/DEL.BAT.png)




U can replace the native `DEL` command by a combination using the `DOSKEY` macro and updating<br>
the registry key `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor`<br>
and adding a string (`AutoRun`) containing path of the doskey macro file

This is What my DOSKEY macro file looks like
```
@echo off

doskey del="c:\users\[my username]\desktop\del.bat" $*
doskey notepad="c:\users\[my username]\desktop\notepad.bat" $*
```

Update: Added support for Whitelists (whitelist.txt) and Blacklists (blacklist.txt)

White lists strike down file deletion.
<br>Example Usage- ```whitelist.bat .\something.png```

You can attrib +h (hide) all the files, including `del.bat`,`blacklist.bat`,`whitelist.bat`,`blacklist.txt`, etc
from the Desktop view

The program <b>over writes</b> the following locations, Make sure u do not have any files/folders with the same name
```
Folder:    Desktop\delete_temp  
File  :    Desktop\whitelist.txt
File  :    Desktop\blacklist.txt
```

Added Features
<br>✅Added support for saving (copy of) last deleted file in delete_temp folder in desktop.
<br>✅Remove the line containing ```set /a belessverbose=0``` for less verbosity.
<br>✅Added support for option of not recycling.

##### Syntax :-<br>
`del.bat [filename] q`  ------> Skips recycling<br>
`del.bat [filename]` -------> Normal delete (requires User to press Z key immediately)

Additional implementations pending-
<br>Mechanism to Lockdown del.bat Write/Delete 
<br>Code Standardization and cleanup for easier customization
<br>Change variable names/labels to obsufcated letters to avoid conflict with other batch files.

