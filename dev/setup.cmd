@echo OFF

for /F "tokens=1,2" %%a in (config/repositories.ini) do (
    call :setup %%a %%b
)

cd "%~dp0"


::
:: Clone repository in given directory, run docker-compose and load migrations
::
:: @param string %1 The directory
:: @param string %2 The repository
::
:setup
    set directory=%1
    set repository=%2

    if "%directory%" NEQ "" (
        mkdir "%~dp0/src/%directory%"
        cd "%~dp0/src/%directory%"
        git clone "%repository%" .
        docker-compose up -d
        docker-compose exec php php bin/console doctrine:migration:migrate
        docker-compose exec php php bin/console doctrine:fixtures:load
    )
goto :EOF
::
