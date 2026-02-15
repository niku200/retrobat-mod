@echo off
echo Checking for RetroBat installer...
if not exist "RetroBatInstaller.exe" (
    echo RetroBat installer not found. Downloading...
    powershell -Command "Invoke-WebRequest -Uri 'https://path-to-retrobat-installer' -OutFile 'RetroBatInstaller.exe'"
)

echo Running RetroBat installer in silent mode...
start /wait RetroBatInstaller.exe /S /D="%cd%\retrobat"
echo RetroBat installation completed.