@echo off
setlocal
title Uptime-kuma-Allinone
cd /d "%~dp0"
echo.
echo 添加重要组件环境变量...
set PATH=%~dp0git_v2.49.0\cmd;%path%
set PATH=%~dp0git_v2.49.0\bin;%path%
set PATH=%~dp0node_v18.20.8;%path%
echo.
echo 准备启动...
cd /d "%~dp0uptime-kuma"

:: 启动 Node.js 服务器
start "" cmd /c node server/server.js

:: 等待服务器启动
:wait_for_server
timeout /t 2 >nul
curl -sSf http://localhost:3001 >nul 2>&1 || goto wait_for_server

:: 异步运行其他命令
start "" cmd /c echo.^& echo ------------------------------------------^& echo           已成功启动Uptime-kuma^& echo           自动为您打开了浏览器^& echo            如果您需要停止程序^& echo           请按下组合键:CTRL + C^& echo ------------------------------------------^& echo.^& start "" "http://localhost:3001"^& pause


REM @echo off
REM setlocal
REM title Uptime-kuma-Allinone
REM cd /d "%~dp0"

REM :: 设置环境变量
REM echo 添加重要组件环境变量...
REM set PATH=%~dp0git_v2.49.0\cmd;%path%
REM set PATH=%~dp0git_v2.49.0\bin;%path%
REM set PATH=%~dp0node_v18.20.8;%path%

REM :: 启动服务器
REM echo 准备启动...
REM start /b cmd /c "cd /d %~dp0uptime-kuma && node server/server.js"
REM echo.

REM :: 等待服务器启动
REM :wait_for_server
REM timeout /t 2 >nul
REM curl -sSf http://localhost:3001 >nul 2>&1 || goto wait_for_server

REM :: 打开浏览器
REM echo.
REM echo ------------------------------------------
REM echo           已成功启动Uptime-kuma
REM echo           自动为您打开了浏览器
REM echo            如果您需要停止程序
REM echo           请按下组合键：CTRL + C
REM echo ------------------------------------------
REM start "" "http://localhost:3001"
REM echo.


REM @echo off
REM setlocal
REM title Uptime-kuma-Allinone
REM cd /d "%~dp0"

REM :: 设置环境变量
REM echo 添加重要组件环境变量...
REM set PATH=%~dp0git_v2.49.0\cmd;%path%
REM set PATH=%~dp0git_v2.49.0\bin;%path%
REM set PATH=%~dp0node_v18.20.8;%path%

REM :: 启动服务器
REM echo 准备启动...
REM start "" /b cmd /c "cd /d %~dp0uptime-kuma && node server/server.js > %temp%\server_output.txt 2>&1"
REM echo.

REM :: 等待服务器启动
REM :wait_for_server
REM timeout /t 1 >nul
REM findstr /m /c:"Listening on" %temp%\server_output.txt >nul 2>&1 || goto wait_for_server

REM :: 打开浏览器
REM echo 已成功启动
REM echo 如果您需要停止程序，请按下组合键：CTRL + C
REM echo 已自动为您打开了浏览器
REM start "" "http://localhost:3001"
REM echo.


REM @echo off
REM setlocal
REM title Uptime-kuma-Allinone
REM cd /d "%~dp0"
REM echo.
REM echo 添加重要组件环境变量...
REM set PATH=%~dp0git_v2.49.0\cmd;%path%
REM set PATH=%~dp0git_v2.49.0\bin;%path%
REM set PATH=%~dp0node_v18.20.8;%path%
REM echo.
REM echo 准备启动...
REM cd /d "%~dp0uptime-kuma"
REM node server/server.js
REM echo.
REM echo "已成功启动"
REM echo "如果您需要停止程序，请按下组合键：CTRL + C "
REM echo "已自动为你打开了浏览器"
REM start "" "http://localhost:3001"
REM pause

