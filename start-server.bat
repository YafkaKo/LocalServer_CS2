@chcp 866 >nul
@echo off
rem Копирует турнирные конфиги и запускает сервер. Окно консоли сервера = пульт админа.
call "%~dp0settings.bat"

if not exist "%SERVER_DIR%\game\bin\win64\cs2.exe" (echo Сервер не установлен. Сначала запустите install.bat. & pause & exit /b 1)

copy /y "%~dp0cfg\*.cfg" "%SERVER_DIR%\game\csgo\cfg\" >nul || (echo Не удалось скопировать конфиги. & pause & exit /b 1)

echo IP этого компьютера в локальной сети (его сообщить игрокам):
powershell -NoProfile -Command "Get-NetIPAddress -AddressFamily IPv4 | ? { $_.IPAddress -notlike '127.*' -and $_.IPAddress -notlike '169.254.*' } | ForEach-Object { '   ' + $_.IPAddress + '   (' + $_.InterfaceAlias + ')' }"
powershell -NoProfile -Command "if (-not (Get-NetIPAddress -IPAddress '%SERVER_IP%' -ErrorAction SilentlyContinue)) { Write-Host 'ВНИМАНИЕ: IP %SERVER_IP% из settings.bat не найден на этом ПК. Впишите в settings.bat адрес вида 192.168.x.x из списка выше.' -ForegroundColor Red }"
echo Игровой порт: %GAME_PORT%   GOTV: %TV_PORT%
echo.

start "CS2 Server" "%SERVER_DIR%\game\bin\win64\cs2.exe" -dedicated -console -usercon -condebug -ip %SERVER_IP% -port %GAME_PORT% -maxplayers %MAX_PLAYERS% +sv_lan 1 +game_type 0 +game_mode 1 +tv_enable 1 +tv_port %TV_PORT% +map %START_MAP%
pause
