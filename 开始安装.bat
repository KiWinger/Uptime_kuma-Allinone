@echo off
title Uptime-kuma-Allinone
cd /d "%~dp0"

setlocal enabledelayedexpansion

rem ��ȡ�������ļ�����Ŀ¼
set "script_dir=%~dp0"

rem ���Ŀ¼���Ƿ������Ϊ uptime-kuma ���ļ���
if exist "%script_dir%uptime-kuma\" (
    rem �����������ʾ�û����� 1 �� 2
	echo --------------------------------
	echo    �ѷ��� uptime-kuma �ļ��У�
	echo.
	echo    1.ȫ�°�װ��ɾ���������ļ���
	echo    2.������װ������֮ǰ�İ�װ��
	echo --------------------------------
	set /p choice=������ 1 �� 2 ��

    rem �����û�����ִ�в�ͬ�Ĳ���
    if "!choice!"=="1" (
        echo ִ�У�ȫ�°�װ
		pause
		rmdir /s /q "%script_dir%uptime-kuma"
		powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
    ) else if "!choice!"=="2" (
        echo ִ�У�������װ
		pause
		powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
    ) else (
        echo ������Ч�������� 1 �� 2��
		pause
    )
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
)

endlocal

REM powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
exit



