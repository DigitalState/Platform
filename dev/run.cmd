::
:: Commands
::
:: run.cmd src dl        Downloads repositories to src folder
:: run.cmd ms init       Initializes microservices
::

@echo OFF

set type=%1
set action=%2

if "%type%" == "src" (
    if "%action%" == "dl" (
        for /F "usebackq tokens=1,2 delims==" %%a in (config/repositories.ini) do (
            echo Downloading src for repository %%a
            call :src_dl %%a %%b
        )
    )
) else if "%type%" == "ms" (
    if "%action%" == "init" (
        for /F "usebackq tokens=1,2 delims==" %%a in (config/microservices.ini) do (
            echo Initializing microservice %%a
            call :ms_init %%a %%b
        )
    )
)

exit /B


::
:: Download repository source into given directory
::
:: @param string %1 The directory
:: @param string %2 The command
::
:src_dl
    set directory=%1
    set command=%2
    set command=###%command%###
    set command=%command:"###=%
    set command=%command:###"=%
    set command=%command:###=%

    cd "%~dp0/src"
    mkdir "%~dp0/src/%directory%"
    cd "%~dp0/src/%directory%"
    %command%
    cd "%~dp0"
goto :EOF
::


::
:: Initializes a microservice
::
:: @param string %1 The directory
:: @param string %2 The command
::
:ms_init
    set directory=%1
    set command=%2
    set command=###%command%###
    set command=%command:"###=%
    set command=%command:###"=%
    set command=%command:###=%

    cd "%~dp0/src/%directory%"
    %command%
    cd "%~dp0"
goto :EOF
::
