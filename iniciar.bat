@echo off
setlocal

REM ==========================================================
REM  Kit portable Dart y Flutter
REM  %~dp0 = unidad y carpeta donde esta guardado este .bat
REM          (incluye la barra final, por ejemplo C:\dev\)
REM  Todos los cambios de variables se hacen con "set" dentro
REM  de esta ventana y se pierden al cerrarla. No se toca el
REM  PATH permanente de Windows.
REM ==========================================================

REM Base portable: la carpeta del script si contiene flutter; si no, C:\dev
set "DEV=%~dp0"
if not exist "%DEV%flutter\bin\flutter.bat" set "DEV=C:\dev\"

set "PATH=%DEV%flutter\bin;%PATH%"
set "PUB_CACHE=%DEV%pub-cache"

REM Carpeta que abrira VS Code: la del script, o proyectos si el script esta en la base
set "PROYECTO=%~dp0"
if /i "%~dp0"=="%DEV%" set "PROYECTO=%DEV%proyectos"

echo ==========================================
echo   ENTORNO PORTABLE DART Y FLUTTER
echo ==========================================
echo.

echo [1/3] Verificando Flutter...
where flutter
if errorlevel 1 (
    echo ERROR: No se encontro Flutter.
    goto error
)

echo.
call flutter --version
if errorlevel 1 (
    echo ERROR: Flutter no pudo ejecutarse.
    goto error
)

echo.
echo [2/3] Verificando VS Code portable...
if not exist "%DEV%vscode\Code.exe" (
    echo ERROR: No se encontro "%DEV%vscode\Code.exe"
    goto error
)

echo VS Code encontrado.
echo.
echo [3/3] Abriendo VS Code portable...
start "" "%DEV%vscode\Code.exe" "%PROYECTO%"

echo.
echo Proceso de inicio completado.
pause
exit /b 0

:error
echo.
echo Se produjo un problema. Revisa los mensajes anteriores.
pause
exit /b 1
