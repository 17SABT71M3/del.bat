@echo off
set /a count=-1
set /a counter=0
for /f "delims=" %%i in ('dir /b /s /a-d %1 ') do set /a counter+=1
if %counter%==0 echo.Unable to Index File & goto :eof
set /a index=counter-1
:loop
set /a count+=1
if %count%==0 for /f "delims=" %%i in ('dir /b /s /a-d %1 2^>NUL') do set file_name="%%i"
if %count% GTR 0 for /f "skip=%count% delims=" %%i in ('dir /b /s /a-d %1 2^>NUL') do set file_name="%%i"&goto :next
:next
echo add file to blacklist ? %file_name% 
choice /c yn
if %errorlevel%==1 type "%userprofile%\desktop\blacklist.txt" | find /i %file_name% >NUL&& echo. >NUL || echo %file_name% >> "%userprofile%\desktop\blacklist.txt"
if %count% LSS %index% goto loop
