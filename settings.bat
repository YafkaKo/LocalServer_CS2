@chcp 866 >nul
@echo off
rem === Общие настройки. Меняйте здесь. ===

rem SteamCMD не должен лежать внутри папки сервера. Куда ставить сервер (~60 ГБ). Не кладите в OneDrive: синхронизация забьёт сеть и диск.
set "SERVER_DIR=C:\CS2Server"
set "STEAMCMD_DIR=C:\steamcmd"

rem Стартовая карта
set "START_MAP=de_mirage"

rem Порты: игра и GOTV (для комментатора/трансляции)
set "GAME_PORT=27015"
set "TV_PORT=27020"

rem 10 игроков + комментатор + запас
set "MAX_PLAYERS=14"

rem IP этого ПК в сети арены. Если IP сменится (см. список при запуске start-server.bat), поменяйте здесь.
rem Без него сервер вешает rcon на адрес WSL и управление из игры не работает.
set "SERVER_IP=192.168.0.100"
