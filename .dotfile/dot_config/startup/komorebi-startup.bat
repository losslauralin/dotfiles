@echo off
REM Komorebi 自启动脚本 - 后台运行
REM 正确启动顺序: Komorebi + whkd -> 等待 -> Yasb

REM 0. 显式指定 config 路径（双保险：即使 KOMOREBI_CONFIG_HOME 未生效也能找到）
set "KOMOREBI_CONFIG=%USERPROFILE%\.config\komorebi\komorebi.json"

REM 1. 启动 Komorebi 和 whkd (热键守护进程) - 必须先启动
komorebic start --whkd --config "%KOMOREBI_CONFIG%"

REM 2. 等待 Komorebi 完全初始化 (whkd 需要)
timeout /t 2 /nobreak > nul

REM 3. 启动 yasb (状态栏) - 隐藏窗口
powershell.exe -Command "Start-Process yasb -WindowStyle Hidden"
