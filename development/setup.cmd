@echo OFF

for /F "tokens=1,2" %%i in (config.ini) do call :process %%i %%j

cd "%~dp0"


:process

    set directory=%1
    set repository=%2

    if "%directory%" NEQ "" (
        mkdir "%~dp0%directory%"
        cd "%~dp0%directory%"
        git clone "%repository%" .
        docker-compose up -d
    )

goto :EOF
