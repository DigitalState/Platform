::
:: Commands
::
:: run.cmd repository:load             Loads repositories to src directories
:: run.cmd key:copy                    Copies public/private keys to repository directories
:: run.cmd container:up                Ups containers
:: run.cmd container:down              Downs containers
:: run.cmd container:stop              Stops containers
:: run.cmd migration:run               Runs database migrations
:: run.cmd data:load                   Loads demo data
::

@echo OFF

if "%1" == "repository:load" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/repository/load.ini) do (
        echo // Loading source for repository %%a
        call :repository_load %%a %%b
    )
) else if "%1" == "key:copy" (
    if not exist ..\resources\keys\public.pem (
        echo // Key "public.pem" does not exist
    ) else if not exist ..\resources\keys\private.pem (
        echo // Key "private.pem" does not exist
    ) else (
        for /F "usebackq tokens=1,2 delims==" %%a in (config/key/copy.ini) do (
            echo // Copying public/private keys into repository %%a
            call :key_copy %%a %%b
        )
    )
) else if "%1" == "container:up" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/container/up.ini) do (
        echo // Upping container %%a
        call :container_up %%a %%b
    )
) else if "%1" == "container:down" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/container/down.ini) do (
        echo // Downing container %%a
        call :container_down %%a %%b
    )
) else if "%1" == "container:stop" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/container/stop.ini) do (
        echo // Stopping container %%a
        call :container_stop %%a %%b
    )
) else if "%1" == "migration:run" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/migration/run.ini) do (
        echo // Running migration for %%a
        call :migration_run %%a %%b
    )
) else if "%1" == "data:load" (
    for /F "usebackq tokens=1,2 delims==" %%a in (config/data/load.ini) do (
        echo // Loading demo data for %%a
        call :data_load %%a %%b
    )
) else (
    echo Command "%1" does not exist.
)

exit /B


::
:: Load repository source into given directory
::
:: @param string %1 The directory
:: @param string %2 The command
::
:repository_load
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
:: Copy public/private keys to repository directory
::
:: @param string %1 The directory
:: @param string %2 The command
::
:key_copy
    set directory=%1
    set command=%2
    set command=###%command%###
    set command=%command:"###=%
    set command=%command:###"=%
    set command=%command:###=%

    %command%
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
:: Run migration
::
:: @param string %1 The directory
:: @param string %2 The command
::
:migration_run
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
:: Load data
::
:: @param string %1 The directory
:: @param string %2 The command
::
:data_load
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
