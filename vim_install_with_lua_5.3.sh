#remove the default vim in ubuntu
sudo apt-get remove vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

#and some dependency for vim
sudo apt-get purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
sudo apt-get build-dep vim-gnome
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
sudo apt-get install lua5.3 liblua5.3-dev	#i need build vim with lua, so install liblua first

#build the lua lib directory
cd /usr/include/lua5.3/
mkdir include
cp ./*.h ./include
mkdir lib
cd lib
ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so ./liblua.so
ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.a ./liblua.a 	#maybe this is not nessary

# so the /usr/include/lua5.3/ looks like this, anyway, make it like this
.
├── include
│   ├── lauxlib.h
│   ├── luaconf.h
│   ├── lua.h
│   └── lualib.h
├── lauxlib.h
├── lib
│   ├── liblua.a -> /usr/lib/x86_64-linux-gnu/liblua5.3.a
│   └── liblua.so -> /usr/lib/x86_64-linux-gnu/liblua5.3.so

#goto any directory you like, then download and build the vim
git clone https://github.com/vim/vim.git
cd vim/src
./configure -with-features=huge \
-enable-cscope \
-enable-rubyinterp \
-enable-largefile \
-disable-netbeans \
-enable-pythoninterp \
-with-python-config-dir=/usr/lib/python2.7/config \
-enable-perlinterp \
-enable-luainterp \
-enable-fail-if-missing \
-with-lua-prefix=/usr/include/lua5.3 \
-enable-gui=gnome2 -enable-cscope -prefix=/usr
make -j20
sudo make install
