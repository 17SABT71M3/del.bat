@echo off
REM echo."%~fp0" %1


title REM

echo.

echo.    File Deletion Disabled  ***Press [Z] to override***

echo.

echo.
echo. 
choice /n /c YNZ /d y /t 1 >NUL
if %errorlevel%==3 goto :del_temp
goto :eof
:del_temp
REM echo.Running del_temp
 @echo off
 set exdirec=
 set file_found=1
 set str=%1

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
 if %1=="%userprofile%\Desktop\del.bat" echo.This File can not be deleted.&goto :eof
 if %1=="%userprofile%\Desktop\del_temp.bat" echo.This File can not be deleted.&goto :eof
 del /p %1
 echo errorlevel:%errorlevel%
 if not exist %1 (if %errorlevel%==0 (echo.File Deleted.) else (echo.Error finding file,)) else (echo.Cancelled.&echo.--^>Checking ..&if exist %1 echo.Found! ----^>%1 )
 Exit /B
 :hehe
 popd