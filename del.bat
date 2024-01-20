@echo off
set /a belessverbose=0
if not exist "%userprofile%\Desktop\Delete_temp" mkdir "%userprofile%\Desktop\Delete_temp" 
if not exist "%userprofile%\Desktop\Delete_temp"\Readme.txt echo.This is a special Folder for Recycling Deleted Files.> "%userprofile%\Desktop\Delete_temp"\Readme.txt
set /a whitelist_Exists=0
set /a blacklist_Exists=0
set str=%1
set arg=%2
if not defined str GOTO :nothing_but_the_end
if defined arg if "%arg%"=="?" set file_return="%~fp1"
if defined arg if "%arg%"=="?" echo %file_return% &GOTO :EOF
for /f "delims=" %%i in ('CALL "%~fp0" %str% ?') DO set file_name=%%i
set /a blacklist=0

if exist "%userprofile%\desktop\blacklist.txt" set /a blacklist_exists=1
if exist "%userprofile%\desktop\blacklist.txt" for /f "delims=" %%i in ('dir "%userprofile%\desktop\blacklist.txt" /ah') do set /a  blacklist_exists=1
if defined str if %blacklist_exists%==1 set /a blacklist=1&type "%userprofile%\desktop\blacklist.txt" | findstr /n /c:%file_name% 2>NUL&&(echo.MATCHES BLACKLIST&goto :del_temp)
REM echo."%~fp0" %1


title REM
echo. [0m [4m File Deletion is Disabled ![0m             
echo.
echo.press z to do [delete] anyways


choice /n /c YNZ /d y /t 1 >NUL

if %errorlevel%==3 goto :del_temp
GOTO :nothing_but_the_end
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
 if NOT EXIST %str% echo. echo. >NUL& echo. ------^>%str%^<-------&echo.(UNKNOWN ARGUMENT) Please check&GOTO :nothing_but_the_end
 if "%exdirec%"=="0 Dir(s)" (set file_found=0)
 if %file_found%==0 (echo.^(File is Hidden^),&GOTO :nothing_but_the_end) else (GOTO :nothing_but_the_end)
 :next
 REM if exist %str% for /f "delims=" %%i in ('dir /s /b /a-d %str% 2^>NUL') do echo Running delete "%%i"&set filetodelete="%%i"
 if exist %str% goto :delete
 goto :hehe
 :delete
 if not exist "%userprofile%\desktop\whitelist.txt"  for /f "delims=" %%i in ('dir /b "%userprofile%\desktop\whitelist.txt" /ah 2^>NUL') do set /a whitelist_Exists=1

 if exist "%userprofile%\desktop\whitelist.txt" set /a whitelist_Exists=1
 if %whiteList_Exists%==1 type "%userprofile%\desktop\whitelist.txt" | find /i %file_name% >NUL&&(echo.This File can not be deleted.&GOTO :nothing_but_the_end)
 if %1=="%userprofile%\Desktop\del.bat" echo.This File can not be deleted.&GOTO :nothing_but_the_end
 if %1=="%userprofile%\Desktop\del_temp.bat" echo.This File can not be deleted.&GOTO :nothing_but_the_end
 :deletealready
 echo  [0m
 for /f "delims=" %%i in ('dir /o-d /tc /b /a-d "%userprofile%\Desktop\Delete_temp"') do set last_file=%%i
 if defined belessverbose echo._________________________________________
 if defined belessverbose echo.Copying files to Recycle Bin (delete_temp). &echo.your oldest file will be deleted from                                 &echo|set/p=                   delete_temp folder& for /f "tokens=*" %%i in ("%last_file%") do echo. ---^>"%%i"
 if defined belessverbose echo._________________________________________
 if defined belessverbose (copy %1 "%userprofile%\Desktop\Delete_temp") else (copy %1 "%userprofile%\Desktop\Delete_temp" 1>NUL 2>NUL)


 del /p %1

 if %blacklist%==0 echo errorlevel:%errorlevel%
 if %blacklist%==1 echo.&echo.
 
 if not exist %1 (if %errorlevel%==0 (echo.[31mFile Deleted.[0m&echo Trying to del "%userprofile%\Desktop\Delete_temp\%last_file%"&del "%userprofile%\Desktop\Delete_temp\%last_file%") else (echo.Error finding file,)) else ( (if %blacklist%==0 echo.Cancelled.)&echo.-- Checking if deleted ..&if exist %1 echo.No ----^>%1 )
 Exit /B
 :hehe
 popd
 :NOTHING_but_THE_end
 ECHO|SET/P=[0m   