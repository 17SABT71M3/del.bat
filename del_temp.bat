 @echo off
 set exdirec092893934=
 set file_found09812132=1
 set hidden_29831212982=false
 set str_jkdjahiells=%1
 if exist %str_jkdjahiells% (pushd %str_jkdjahiells% 2>NUL)
 if exist %str_jkdjahiells% (if "%errorlevel%"=="0" (echo This is a directory.&goto :heheKLdKlask))
 for /f "tokens=1,2 delims= " %%i in ('dir %str_jkdjahiells% 2^>NUL') do set exdirec092893934=%%i %%j
 if "%exdirec092893934%"=="0 Dir(s)" (set file_found09812132=0)
 if %file_found09812132%==0 echo File Found!&goto :next094821933
 if "%file_found09812132%" NEQ "0" for /f "tokens=1,2 delims= " %%i in ('dir /ah %str_jkdjahiells% 2^>NUL') do set exdirec092893934=%%i %%j
 if NOT EXIST %str_jkdjahiells% echo. echo. >NUL& echo. ------^>%str_jkdjahiells%^<-------&echo. Please check&goto :eof
 if "%exdirec092893934%"=="0 Dir(s)" (set file_found09812132=0)
 if %file_found09812132%==0 (echo File is Hidden,&goto :eof) else (goto :eof)
 :next094821933
 if exist %str_jkdjahiells% for /f "delims=" %%i in ('dir /s /b /a-d %str_jkdjahiells% 2^>NUL') do call :delete "%%i"
 goto :heheKLdKlask
 :delete
 del /p %1
 if not exist %1 echo.File Deleted.
 Exit /B
 :heheKLdKlask
 popd
