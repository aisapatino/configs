REM copy over single files. /Y allows overwrite.
COPY /Y .vimrc C:\Users\aisa\
COPY /Y .gitconfig C:\Users\aisa\
COPY /Y .gitignore C:\Users\aisa\
COPY /Y aisa.vim C:\Users\aisa\vimfiles\colors
COPY /Y fl-gitconfig "C:\Program Files (x86)\World of Warcraft\interface\addons\flamingloot\.git\config"
COPY /Y flml-gitconfig "C:\Program Files (x86)\World of Warcraft\interface\addons\flaminglootsys\.git\config"
REM /s include subdirecties, /e copy all subdir, even if empty
XCOPY /Y bundle C:\Users\aisa\vimfiles\bundle /s /e
pause
