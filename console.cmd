::
:: Commands
::
:: This is a workaround for windows-based labs
::
:: console.cmd container:up                Ups containers
:: console.cmd container:down              Downs containers
::

@echo OFF

if "%1" == "container:up" (
    call :container_up "service/assets"
    call :container_up "service/authentication"
    call :container_up "service/camunda"
    call :container_up "service/cases"
    call :container_up "service/cms"
    call :container_up "service/identities"
    call :container_up "service/records"
    call :container_up "service/services"
    call :container_up "service/tasks"
) else if "%1" == "container:down" (
    call :container_down "service/assets"
    call :container_down "service/authentication"
    call :container_down "service/camunda"
    call :container_down "service/cases"
    call :container_down "service/cms"
    call :container_down "service/identities"
    call :container_down "service/records"
    call :container_down "service/services"
    call :container_down "service/tasks"
) else (
    echo Command "%1" does not exist.
)

exit /B

::
:: Up container
::
:: @param string %1 The directory
:: @param string %2 The command
::
:container_up
    set directory=%1
    set command=%2

    cd "%~dp0/%directory%"
    docker-compose up -d
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

    cd "%~dp0/%directory%"
    docker-compose down
    cd "%~dp0"
goto :EOF
::
