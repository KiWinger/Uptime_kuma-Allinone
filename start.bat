@echo off
setlocal
title Uptime-kuma-Allinone
cd /d "%~dp0"
echo.
echo �����Ҫ�����������...
set PATH=%~dp0git_v2.49.0\cmd;%path%
set PATH=%~dp0git_v2.49.0\bin;%path%
set PATH=%~dp0node_v18.20.8;%path%
echo.
echo ׼������...
cd /d "%~dp0uptime-kuma"

:: ���� Node.js ������
start "" cmd /c node server/server.js

:: �ȴ�����������
:wait_for_server
timeout /t 2 >nul
curl -sSf http://localhost:3001 >nul 2>&1 || goto wait_for_server

:: �첽������������
start "" cmd /c echo.^& echo ------------------------------------------^& echo           �ѳɹ�����Uptime-kuma^& echo           �Զ�Ϊ�����������^& echo            �������Ҫֹͣ����^& echo           �밴����ϼ�:CTRL + C^& echo ------------------------------------------^& echo.^& start "" "http://localhost:3001"^& pause


REM @echo off
REM setlocal
REM title Uptime-kuma-Allinone
REM cd /d "%~dp0"

REM :: ���û�������
REM echo �����Ҫ�����������...
REM set PATH=%~dp0git_v2.49.0\cmd;%path%
REM set PATH=%~dp0git_v2.49.0\bin;%path%
REM set PATH=%~dp0node_v18.20.8;%path%

REM :: ����������
REM echo ׼������...
REM start /b cmd /c "cd /d %~dp0uptime-kuma && node server/server.js"
REM echo.

REM :: �ȴ�����������
REM :wait_for_server
REM timeout /t 2 >nul
REM curl -sSf http://localhost:3001 >nul 2>&1 || goto wait_for_server

REM :: �������
REM echo.
REM echo ------------------------------------------
REM echo           �ѳɹ�����Uptime-kuma
REM echo           �Զ�Ϊ�����������
REM echo            �������Ҫֹͣ����
REM echo           �밴����ϼ���CTRL + C
REM echo ------------------------------------------
REM start "" "http://localhost:3001"
REM echo.


REM @echo off
REM setlocal
REM title Uptime-kuma-Allinone
REM cd /d "%~dp0"

REM :: ���û�������
REM echo �����Ҫ�����������...
REM set PATH=%~dp0git_v2.49.0\cmd;%path%
REM set PATH=%~dp0git_v2.49.0\bin;%path%
REM set PATH=%~dp0node_v18.20.8;%path%

REM :: ����������
REM echo ׼������...
REM start "" /b cmd /c "cd /d %~dp0uptime-kuma && node server/server.js > %temp%\server_output.txt 2>&1"
REM echo.

REM :: �ȴ�����������
REM :wait_for_server
REM timeout /t 1 >nul
REM findstr /m /c:"Listening on" %temp%\server_output.txt >nul 2>&1 || goto wait_for_server

REM :: �������
REM echo �ѳɹ�����
REM echo �������Ҫֹͣ�����밴����ϼ���CTRL + C
REM echo ���Զ�Ϊ�����������
REM start "" "http://localhost:3001"
REM echo.


REM @echo off
REM setlocal
REM title Uptime-kuma-Allinone
REM cd /d "%~dp0"
REM echo.
REM echo �����Ҫ�����������...
REM set PATH=%~dp0git_v2.49.0\cmd;%path%
REM set PATH=%~dp0git_v2.49.0\bin;%path%
REM set PATH=%~dp0node_v18.20.8;%path%
REM echo.
REM echo ׼������...
REM cd /d "%~dp0uptime-kuma"
REM node server/server.js
REM echo.
REM echo "�ѳɹ�����"
REM echo "�������Ҫֹͣ�����밴����ϼ���CTRL + C "
REM echo "���Զ�Ϊ����������"
REM start "" "http://localhost:3001"
REM pause

