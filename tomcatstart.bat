@echo off
mode con cols=60 lines=10
REM 定义窗口大小
cd /d "%~dp0"
REM 以管理员身份运行 
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin
mode con cols=60 lines=10

REM 请修改下方的tomcat9为你的服务项名称
net start tomcat9

if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit
