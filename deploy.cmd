@echo off
setlocal EnableExtensions
rem ------------------------------------------------------------------
rem  Publish thewamr.com
rem
rem  Builds the site, copies it into the GitHub Pages checkout that
rem  lives next to this folder (..\thewamr.github.io), shows the list
rem  of files that will change, asks for a yes, then commits and pushes.
rem  Nothing is live until that final push.
rem
rem  Usage:   deploy.cmd "what changed"
rem           deploy.cmd "what changed" -y      (skip the question)
rem
rem  This script does not touch the source repo. After deploying,
rem  commit and push this folder too (see README.md).
rem ------------------------------------------------------------------

cd /d "%~dp0"
set "DEPLOY=%~dp0..\thewamr.github.io"

if not exist "%DEPLOY%\.git" (
    echo Deploy checkout not found at "%DEPLOY%".
    echo Clone it first with:
    echo   git clone https://github.com/thewamr/thewamr.github.io.git "%DEPLOY%"
    exit /b 1
)

echo.
echo === 1/4  Building the site ===
hugo --cleanDestinationDir
if errorlevel 1 (
    echo Hugo build failed. Nothing was published.
    exit /b 1
)

echo.
echo === 2/4  Copying the build into the deploy checkout ===
robocopy public "%DEPLOY%" /MIR /XD .git /NFL /NDL /NJH /NJS /NP
if errorlevel 8 (
    echo Copy failed. Nothing was published.
    exit /b 1
)

cd /d "%DEPLOY%"
git add -A
git diff --cached --quiet
if not errorlevel 1 (
    echo.
    echo Nothing has changed since the last deploy.
    exit /b 0
)

echo.
echo === 3/4  Files that will go live ===
git diff --cached --stat
echo.

if /i "%~2"=="-y" goto :publish
set /p CONFIRM=Publish these changes to thewamr.com? [y/N]
if /i not "%CONFIRM%"=="y" (
    echo Cancelled. Nothing was published.
    exit /b 0
)

:publish
set "MSG=%~1"
if "%MSG%"=="" set "MSG=Deploy %date% %time%"

echo.
echo === 4/4  Pushing to GitHub Pages ===
git commit -q -m "%MSG%"
git push origin main
if errorlevel 1 (
    echo Push failed. Check your GitHub sign-in, then run:  cd "%DEPLOY%"  and  git push origin main
    exit /b 1
)

echo.
echo Done. thewamr.com updates within a minute or two.
echo Reminder: commit and push the source folder too so GitHub has the current source.
endlocal
