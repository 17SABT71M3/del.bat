@echo off
set arg=%2
set /a count=-1
set /a counter=0
if defined arg if "%arg%"=="?" set file_name="%~fp1"
if defined arg if "%arg%"=="?" (if exist %file_name% echo %file_name%)&goto :eof
for /f "delims=" %%i in ('"%~fp0" %1 ? ') do set /a counter+=1
if %counter%==0 echo.Unable to Index File & goto :eof
set /a index=counter-1
:loop
set /a count+=1
if %count%==0 for /f "delims=" %%i in ('"%~fp0" %1 ? 2^>NUL') do set file_name=%%i
if %count% GTR 0 for /f "skip=%count% delims=" %%i in ('"%~fp0" %1 ?  2^>NUL') do set file_name=%%i&goto :next
:next
echo WHITELIST file? %file_name% 
choice /c yn
if %errorlevel%==1 type "%userprofile%\desktop\whitelist.txt" 2^>NUL | find /i %file_name% >NUL&& echo. >NUL || echo %file_name% >> "%userprofile%\desktop\whitelist.txt"
if %count% LSS %index% goto loop