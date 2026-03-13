@echo off
color 0a
title errorlevel.bat
mode con lines=19 cols=79
goto :tasklist_task
:tasklist_task
for %%t in ("imagename eq python3.11.exe") do (tasklist /fi %%t | find /i "python3.11.exe" > nul)
if %errorlevel%==0 (
goto :taskkill_task
) else (
goto :start_task
)
:taskkill_task
for %%k in ("imagename eq python3.11.exe") do (tasklist /fi %%k | find /i "python3.11.exe" > nul)
if not %errorlevel%==1 (
taskkill /f /im "python3.11.exe" && goto :exit
) else (
goto :start_task
)
:start_task
start "" "python3.11.exe"
goto :exit
:exit
exit /b