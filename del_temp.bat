 @echo off
 set exdirec092893934=
 set file_found0981213209812132=1
 set hidden_29831212982=false
 set str=%1
 if exist %str% (pushd %str% 2>NUL)
 if exist %str% (if "%errorlevel%"=="0" (echo This is a directory.&goto :hehe))
 for /f "tokens=1,2 delims= " %%i in ('dir %str% 2^>NUL') do set exdirec092893934=%%i %%j
 if "%exdirec092893934%"=="0 Dir(s)" (set file_found09812132=0)
 if %file_found09812132%==0 echo File Found!&goto :next
 if "%file_found09812132%" NEQ "0" for /f "tokens=1,2 delims= " %%i in ('dir /ah %str% 2^>NUL') do set exdirec092893934=%%i %%j
 if NOT EXIST %str% echo. echo. >NUL& echo. ------^>%str%^<-------&echo. Please check&goto :eof
 if "%exdirec092893934%"=="0 Dir(s)" (set file_found09812132=0)
 if %file_found09812132%==0 (echo File is Hidden,&goto :eof) else (goto :eof)
 :next
 if exist %str% for /f "delims=" %%i in ('dir /s /b /a-d %str% 2^>NUL') do call :delete "%%i"
 goto :hehe
 :delete
 del /p %1
 if not exist %1 echo.File Deleted.
 Exit /B
 :hidden
 Echo. Yaan File is hidden.......please solve it
 :hehe
 popd
