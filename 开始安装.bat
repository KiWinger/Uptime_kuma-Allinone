@echo off
title Uptime-kuma-Allinone
cd /d "%~dp0"

setlocal enabledelayedexpansion

rem 获取批处理文件所在目录
set "script_dir=%~dp0"

rem 检查目录中是否存在名为 uptime-kuma 的文件夹
if exist "%script_dir%uptime-kuma\" (
    rem 弹出输入框，提示用户输入 1 或 2
	echo --------------------------------
	echo    已发现 uptime-kuma 文件夹：
	echo.
	echo    1.全新安装（删除已下载文件）
	echo    2.继续安装（继续之前的安装）
	echo --------------------------------
	set /p choice=请输入 1 或 2 ：

    rem 根据用户输入执行不同的操作
    if "!choice!"=="1" (
        echo 执行：全新安装
		pause
		rmdir /s /q "%script_dir%uptime-kuma"
		powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
    ) else if "!choice!"=="2" (
        echo 执行：继续安装
		pause
		powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
    ) else (
        echo 输入无效，请输入 1 或 2。
		pause
    )
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
)

endlocal

REM powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
exit



