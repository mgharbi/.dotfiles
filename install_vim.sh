git clone https://github.com/vim/vim.git vim_install
cd vim_install
sudo make distclean
./configure \
--enable-multibyte \
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--enable-fail-if-missing \
make && sudo make install
cd ..
rm -rf vim_install
sudo rm /usr/bin/vi
sudo ln -s /usr/bin/vim /usr/bin/vi
