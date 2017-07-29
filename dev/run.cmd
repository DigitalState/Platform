@echo OFF

set command=%1

if "%command%" == "clone" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/repositories.ini) do (
        echo Cloning repository %%a
        call :clone %%a %%b
    )
) else if "%command%" == "up" (
    for /F "usebackq tokens=1" %%a in (config/microservices.ini) do (
        echo Docker up %%a
        call :up %%a
    )
) else (
    echo error: You must provide a command.
)

exit /B


::
:: Git clone repository in given directory
::
:: @param string %1 The directory
:: @param string %2 The repository
::
:clone
    set directory=%1
    set repository=%2

    cd "%~dp0/src"
    mkdir "%~dp0/src/%directory%"
    cd "%~dp0/src/%directory%"
    git clone "%repository%" .
    cd "%~dp0"
goto :EOF
::


::
:: Docker up directory
::
:: @param string %1 The directory
::
:up
    set directory=%1

    cd "%~dp0/src/%directory%"
    docker-compose up -d
    cd "%~dp0"
goto :EOF
::
