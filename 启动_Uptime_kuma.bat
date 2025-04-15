@echo off
title Uptime-kuma-Allinone
cd /d "%~dp0"
setlocal enabledelayedexpansion

rem 获取批处理文件所在目录
set "script_dir=%~dp0"

rem 检查目录中是否存在名为 uptime-kuma 的文件夹
if exist "%script_dir%uptime-kuma\" (
	call start.bat
) else (
    echo --------------------------------
	echo    未找到 uptime-kuma 文件夹：
	echo.
	echo      无法启动，请重新安装。
	echo --------------------------------
	pause
)

endlocal