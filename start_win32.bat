@echo off
title Toontown CLI Launcher

rem Read the contents of PPYTHON_PATH into %PPYTHON_PATH%:
set /P PYTHON_PATH=<PYTHON_PATH

echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo What do you want to do!
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo.
echo #1 - Run Toontown Aftermath
echo #3 - Exit
echo.
:selection
choice /C:12 /n /m "Selection: "%1
if errorlevel ==2 EXIT
if errorlevel ==1 goto run


:run
cls
echo ===============================================================
echo What do you want to launch!
echo ===============================================================
echo. 
echo #1 - Locally Host a Server
echo #2 - Connect to an Existing Server
echo.
choice /C:12 /n /m "Selection: "%1
if errorlevel ==2 goto connect
if errorlevel ==1 goto localhost


:localhost
cls 
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo Starting Localhost!
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
cd scripts
echo Launching the AI Server...
START ai-server-win32.bat
echo Launching Astron...
START astron-cluster-win32.bat
echo Launching the Uberdog Server...
START uberdog-server-win32.bat
SET TT_GAMESERVER=127.0.0.1
cd ..
goto game

:connect
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo Gameserver [!]
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
set /P TT_GAMESERVER="Gameserver: "
SET TT_GAMESERVER=%TT_GAMESERVER%
echo.
goto game

:game
cls
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo Username [!] This does get stored in your source code so beware!
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
set /P TT_Username="Username: "
set /P TT_Password="Password: "
echo.
cls
SET TIA_PLAYCOOKIE=%TIA_Username%%TIA_Password%
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo Welcome to Toontown, %TIA_Username%!
echo The Tooniverse Awaits You!
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
:startgame
title Toontown Client
%PYTHON_PATH% -m toontown.launcher.TTOffQuickStartLauncher
PAUSE
goto startgame
