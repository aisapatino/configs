REM copy over single files. /Y allows overwrite.
COPY /Y \vim\.vimrc C:\Users\aisa\
COPY /Y \vim\aisa.vim C:\Users\aisa\vimfiles\colors
COPY /Y \git\.gitconfig C:\Users\aisa\
COPY /Y \git\.gitignore C:\Users\aisa\
COPY /Y \git\fl-gitconfig "C:\Program Files (x86)\World of Warcraft\interface\addons\flamingloot\.git\config"
COPY /Y \git\flml-gitconfig "C:\Program Files (x86)\World of Warcraft\interface\addons\flaminglootsys\.git\config"

REM /s include subdirecties, /e copy all subdir, even if empty
XCOPY /Y \vim\bundle C:\Users\aisa\vimfiles\bundle /s /e
pause
