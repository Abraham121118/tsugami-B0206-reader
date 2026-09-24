@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ---- Sync to GitHub ----
git add -A
git diff --cached --quiet
if not errorlevel 1 goto nochanges
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HHmm"') do set STAMP=%%i
git commit -m "update %STAMP%"
git push
echo.
echo ---- Done ----
goto end
:nochanges
echo No changes. Nothing to push.
:end
echo.
pause
