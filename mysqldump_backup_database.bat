@echo off
title mysql_backup_database.bat
color 0a
mode con cols=67 lines=19
goto :mysqldump
:mysqldump
set mysqldump_path=%programfiles%\MySQL\MySQL Server 8.0\bin
set /p ht="host: "
set /p Pt="Port: "
set /p ur="user: "
set /p db="Database: "
for %%m in ("%mysqldump_path%") do (cd /d "%%~m")
for %%b in ("%~dp0backup_%db%.sql") do (mysqldump --column-statistics=0 -h %ht% -P %Pt% -u %ur% -p %db% > "%%~b" && cls)
echo "Backup successfully completed!" 
pause > nul
goto :exit
:exit
exit
