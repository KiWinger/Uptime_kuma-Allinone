@echo off
title Uptime-kuma-Allinone
cd /d "%~dp0"
setlocal enabledelayedexpansion

rem ��ȡ�������ļ�����Ŀ¼
set "script_dir=%~dp0"

rem ���Ŀ¼���Ƿ������Ϊ uptime-kuma ���ļ���
if exist "%script_dir%uptime-kuma\" (
	call start.bat
) else (
    echo --------------------------------
	echo    δ�ҵ� uptime-kuma �ļ��У�
	echo.
	echo      �޷������������°�װ��
	echo --------------------------------
	pause
)

endlocal