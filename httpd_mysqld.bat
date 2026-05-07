@echo off
title httpd_mysqld
color 0a
mode con cols=69 lines=17
:tasklist_task_httpd
for %%t in ("imagename eq apached.exe") do (tasklist /fi %%t | find /i "apached.exe" > nul)
if %errorlevel%==0 (
goto :taskkill_task_httpd
) else (
goto :start_task_httpd
)
goto :start_task_httpd
:start_task_httpd
cd /d C:\xampp
start apache_start.bat
timeout /t 1 > nul
:tasklist_task_mysqld
for %%t in ("imagename eq mysqld.exe") do (tasklist /fi %%t | find /i "mysqld.exe" > nul)
if %errorlevel%==0 (
goto :taskkill_task_mysqld
) else (
goto :tasklist_task_mysqld
)
goto :tasklist_task_mysqld
:tasklist_task_mysqld
cd /d C:\xampp
start mysql_start.bat
timeout /t 1 > nul
:exit
exit