:: Edit the ps1 file to add new dotfiles files
@powershell -NoProfile ./makesymlinks.ps1

:: mklink /d %HOMEDRIVE%\.vim %HOMEDRIVE%\dotfiles\vim
