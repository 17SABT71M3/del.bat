@echo off
set /a belessverbose=0
if not exist "%userprofile%\Desktop\Delete_temp" mkdir "%userprofile%\Desktop\Delete_temp" 
if not exist "%userprofile%\Desktop\Delete_temp"\Readme.txt echo.This is a special Folder for Recycling Deleted Files.> "%userprofile%\Desktop\Delete_temp"\Readme.txt
set /a whitelist_Exists=0
set /a blacklist_Exists=0
set str=%1
set arg=%2
if not defined str goto :eof
if defined arg if "%arg%"=="?" set file_return="%~fp1"
if defined arg if "%arg%"=="?" echo %file_return%&goto :eof
for /f "delims=" %%i in ('"%~fp0" %str% ?') DO set file_name=%%i
set /a blacklist=0
if exist "%userprofile%\desktop\blacklist.txt" set /a blacklist_exists=1
if exist "%userprofile%\desktop\blacklist.txt" for /f "delims=" %%i in ('dir "%userprofile%\desktop\blacklist.txt" /ah') do set /a  blacklist_exists=1
if defined str if %blacklist_exists%==1 set /a blacklist=1&type "%userprofile%\desktop\blacklist.txt" | findstr /n /c:%file_name% &&(echo.MATCHES BLACKLIST&goto :del_temp)
REM echo."%~fp0" %1


title REM
echo./----------------------------------------.
echo.^| File Deletion Disabled !               ^|
echo..----------------------------------------^/

echo.                                   Press Z
echo.                                to Persist

choice /n /c YNZ /d y /t 1 >NUL
if %errorlevel%==3 goto :del_temp
goto :eof
:del_temp
REM echo.Running del_temp
 @echo off
 set exdirec=
 set file_found=1
 if exist %str% (pushd %str% 2>NUL)
 set /a err_level=%errorlevel%
 popd
 if exist %str% if "%err_level%"=="0" (echo This is a directory.&goto :hehe)
 for /f "tokens=1,2 delims= " %%i in ('dir %str% 2^>NUL') do set exdirec=%%i %%j
 if "%exdirec%"=="0 Dir(s)" (set file_found=0)
 if %file_found%==0 echo File Found!&goto :next
 if "%file_found%" NEQ "0" for /f "tokens=1,2 delims= " %%i in ('dir /ah %str% 2^>NUL') do set exdirec=%%i %%j
 if NOT EXIST %str% echo. echo. >NUL& echo. ------^>%str%^<-------&echo.(UNKNOWN ARGUMENT) Please check&goto :eof
 if "%exdirec%"=="0 Dir(s)" (set file_found=0)
 if %file_found%==0 (echo File is Hidden,&goto :eof) else (goto :eof)
 :next
 REM if exist %str% for /f "delims=" %%i in ('dir /s /b /a-d %str% 2^>NUL') do echo Running delete "%%i"&set filetodelete="%%i"
 if exist %str% goto :delete
 goto :hehe
 :delete

 if not exist "%userprofile%\desktop\whitelist.txt"  for /f "delims=" %%i in ('dir /b "%userprofile%\desktop\whitelist.txt" /ah 2^>NUL') do set /a whitelist_Exists=1

 if exist "%userprofile%\desktop\whitelist.txt" set /a whitelist_Exists=1
 if %whiteList_Exists%==1 type "%userprofile%\desktop\whitelist.txt" | find /i %file_name% >NUL&&(echo.This File can not be deleted.&goto :eof)
 if %1=="%userprofile%\Desktop\del.bat" echo.This File can not be deleted.&goto :eof
 if %1=="%userprofile%\Desktop\del_temp.bat" echo.This File can not be deleted.&goto :eof
 :deletealready
 
 for /f "delims=" %%i in ('dir /o-d /tc /b /a-d "%userprofile%\Desktop\Delete_temp"') do set last_file=%%i
 if defined belessverbose echo.Copying files to Recycle Bin (delete_temp). last file to be deleted from delete_temp=%last_file%
 
 if defined belessverbose (copy %1 "%userprofile%\Desktop\Delete_temp") else (copy %1 "%userprofile%\Desktop\Delete_temp" 1>NUL 2>NUL)
 del /p %1
 if defined belessverbose echo  = = = = = = = = = 
 if %blacklist%==0 echo errorlevel:%errorlevel%
 if %blacklist%==1 echo.&echo.
 if not exist %1 (if %errorlevel%==0 (echo.File Deleted.&echo Trying to del "%userprofile%\Desktop\Delete_temp\%last_file%"&del "%userprofile%\Desktop\Delete_temp\%last_file%") else (echo.Error finding file,)) else ( (if %blacklist%==0 echo.Cancelled.)&echo.--^>Checking ..&if exist %1 echo.Found! ----^>%1 )
 Exit /B
 :hehe
 popd