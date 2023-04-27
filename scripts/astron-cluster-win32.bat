@echo off
cd "../astron/"
title Toontown Astron
mode con: cols=60 lines=20

:start
astrond_win32 --loglevel info config/astrond.yml
PAUSE
goto start
