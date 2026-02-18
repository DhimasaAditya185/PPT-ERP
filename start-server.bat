@echo off
echo ==========================================
echo   IMAJI ERP + QMS Presentation Server
echo ==========================================
echo.

:: Check if Python is available
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Starting server with Python...
    echo.
    echo Buka browser dan akses: http://localhost:8080
    echo Tekan Ctrl+C untuk stop server
    echo.
    python -m http.server 8080
    goto :end
)

:: Check if Node.js npx is available
where npx >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Starting server with npx serve...
    echo.
    echo Buka browser dan akses URL yang muncul di bawah
    echo Tekan Ctrl+C untuk stop server
    echo.
    npx serve . -p 8080
    goto :end
)

echo ERROR: Python atau Node.js tidak ditemukan.
echo.
echo Install salah satu:
echo   - Python: https://www.python.org/downloads/
echo   - Node.js: https://nodejs.org/
echo.
echo Atau gunakan VSCode Live Server extension.
echo.
pause

:end
