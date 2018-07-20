sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
 
sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev python3-dev libpython-dev libpython3-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

#Optional: so vim can be uninstalled again via `dpkg -r vim`
sudo apt-get install checkinstall

sudo rm -rf /usr/local/share/vim /usr/bin/vim

cd /home/gharbi
git clone https://github.com/vim/vim
cd vim
git pull && git fetch

# In case Vim was already installed
cd src
make distclean
cd ..

./configure \
--enable-multibyte \
--enable-rubyinterp=yes \
--enable-perlinterp=yes \
--enable-luainterp=yes \
--with-luajit \
--enable-pythoninterp=yes \
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
--with-x \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--enable-fail-if-missing \

make && sudo make install

#--prefix=/usr/local/bin
