@echo OFF

for /F "tokens=1,2" %%i in (config/repositories.ini) do call :process %%i %%j

cd "%~dp0"


:process

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
