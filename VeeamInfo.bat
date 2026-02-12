@echo off

for /f "delims=" %%a in ('powershell -Command "Get-ExecutionPolicy"') do set "execution_policy=%%a"

if "%execution_policy%" == "Unrestricted" (
    echo.
) else (
    color 4
    echo La politique d'execution est restreinte.
    echo Vous devez l'activer : voir Nextcloud\TECHNIQUE\Mmicro\Script\ActiverScriptPS1
    pause
    exit
)

set "veeamPath=C:\Program Files\Veeam"
set "jobPath=C:\ProgramData\Veeam\Endpoint\Job_%computername%"

::MENU
if exist "%veeamPath%" (
    type content\mainmenu.txt
    echo.
    echo.
    echo Ce script ne fonctione que pour Veeam Agent for Microsoft Windows
    echo.
    pause
    cls
    timeout 1 > NUL
) else (
    echo Le logiciel n'est pas present sur le poste.
    pause
)

::VERSION
reg query "HKLM\SOFTWARE\Veeam\Veeam Agent for Microsoft Windows" > nul 2>&1
if %errorlevel%==0 (
  for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Veeam\Veeam Agent for Microsoft Windows" /v Version ^| find /i "Version"') do set version=%%a
) else (
  echo Veeam Agent for Microsoft Windows n'est pas installé.
  pause
  exit /b 0
)

echo Version de Veeam : %version%
echo.

::SAUVEGARDE
if exist "%jobPath%" (
    echo Une solution de sauvegarde est active
    echo.
    timeout 2 > NUL
) else (
    echo Aucune solution de sauvegarde est active
    timeout 5 > NUL
    exit
)

echo [1] Afficher la configuration      [2] Exporter la configuration au format texte

set /p answer="-->"

if %answer%==1 (
    powershell -File ".\configsearch.ps1"
    pause
) else (
    if %answer% ==2 (
        powershell -File ".\configsearchtxt.ps1"
    ) else (
        echo Réponse incorrect
    )
)