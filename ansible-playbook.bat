@echo off
setlocal enableextensions enabledelayedexpansion

set SCRIPT_PATH=%~dp0
set SCRIPT_PATH=%SCRIPT_PATH:\=/%
set BABUN_HOME=%SCRIPT_PATH%

:BEGIN
set CYGWIN_HOME=%BABUN_HOME%\cygwin
if exist "%CYGWIN_HOME%\bin\mintty.exe" goto RUN
if not exist "%CYGWIN_HOME%\bin\mintty.exe" goto NOTFOUND

:RUN
ECHO [babun] Starting babun
"%CYGWIN_HOME%\bin\mintty.exe" -h always --exec /bin/ansible-playbook %* || goto :ERROR
GOTO END

:NOTFOUND
ECHO [babun] Start script not found. Did you delete the the .babun folder from the USER_HOME?
EXIT /b 255

:ERROR
ECHO [babun] Terminating due to internal error #%errorlevel%
EXIT /b %errorlevel%

:END
