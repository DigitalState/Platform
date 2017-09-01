::
:: Commands
::
:: run.cmd source:download         Downloads repositories to src folder
:: run.cmd container:up            Up containers
:: run.cmd container:down          Down containers
:: run.cmd container:stop          Stop containers
:: run.cmd fixture:load            Load fixtures
::

@echo OFF

if %1 == "source:download" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/source/download.ini) do (
        echo Downloading source for repository %%a
        call :source_download %%a %%b
    )
) else if %1 == "container:up" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/container/up.ini) do (
        echo Upping container %%a
        call :container_up %%a %%b
    )
) else if %1 == "container:down" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/container/down.ini) do (
        echo Downing container %%a
        call :container_down %%a %%b
    )
) else if %1 == "container:stop" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/container/stop.ini) do (
        echo Stopping container %%a
        call :container_stop %%a %%b
    )
) else if %1 == "fixture:load" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/fixture/load.ini) do (
        echo Loading fixture for %%a
        call :fixture_load %%a %%b
    )
)

exit /B


::
:: Download repository source into given directory
::
:: @param string %1 The directory
:: @param string %2 The command
::
:source_download
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
:: Up container
::
:: @param string %1 The directory
:: @param string %2 The command
::
:container_up
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


::
:: Down container
::
:: @param string %1 The directory
:: @param string %2 The command
::
:container_down
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


::
:: Stop container
::
:: @param string %1 The directory
:: @param string %2 The command
::
:container_stop
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


::
:: Load fixture
::
:: @param string %1 The directory
:: @param string %2 The command
::
:fixture_load
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
