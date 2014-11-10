REM copy over single files. /Y allows overwrite.
COPY /Y \vim\.vimrc C:\Users\aisa\
COPY /Y \vim\.gvimrc C:\Users\aisa\
COPY /Y \vim\colors\aisa.vim C:\Users\aisa\vimfiles\colors
COPY /Y \vim\colors\aisadark.vim C:\Users\aisa\vimfiles\colors
COPY /Y \vim\CustomGrepFileAssoc C:\Users\aisa\vimfiles

COPY /Y \git\.gitconfig C:\Users\aisa\
COPY /Y \git\.gitignore C:\Users\aisa\
COPY /Y \git\fl-gitconfig "C:\Program Files (x86)\World of Warcraft\interface\addons\flamingloot\.git\config"
COPY /Y \git\flml-gitconfig "C:\Program Files (x86)\World of Warcraft\interface\addons\flaminglootsys\.git\config"

REM /s include subdirecties, /e copy all subdir, even if empty
REM XCOPY /Y \vim\bundle C:\Users\aisa\vimfiles\bundle /s /e
git clone https://github.com/gmarik/Vundle.vim.git C:\Users\aisa\vimfiles\bundle\Vundle.vim
XCOPY /Y \vim\custom-syntax C:\Users\aisa\vimfiles
XCOPY /Y \vim\custom-snippets C:\Users\aisa\vimfiles
pause
