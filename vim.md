## vimdiff
do, diff obtain
dp, diff put
]c, next diff
[c, previous diff
:diffu[pdate], update files modified

## colorsheme
set background=light or dark
:colorscheme molokai/desert/peaksea/solarized/koehler/slate/evening/torte/default

## build and install
download: http://www.vim.org/git.php
```
./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes \
--enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config \
--enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.5/config \
--enable-perlinterp=yes --enable-luainterp=yes --with-lua-prefix=/export/pingzhiguo/usr/local \
--enable-gui=gtk2 --enable-cscope=yes --prefix=/export/pingzhiguo/bin
```
if configure error with "You need to install a terminal library; for example ncurses."
install ncurses via `sudo apt-get install ncurses-dev`

`$ make VIMRUNTIMEDIR=/export/pingzhiguo/shared/vim/runtime`

`$ mv src/vim ~/bin/`
