#!/usr/bin/python
import os
import subprocess

print "Installing dotfiles"
print "-------------------\n"

home_dir       = os.getenv("HOME")

dotfiles_dir   = os.path.dirname(os.path.abspath(__file__))
zsh_dir        = os.path.join(home_dir,".oh-my-zsh")
vimplugins_dir = os.path.join(home_dir,".vimplugins")

# Install homebrew and libraries

if not os.path.exists(zsh_dir):
    print "Installing Oh-My-Zsh..."
    r = subprocess.call([
        "git",
        "clone",
        "https://github.com/mgharbi/oh-my-zsh",
        zsh_dir,
    ])
if not os.path.exists(vimplugins_dir):
    print "Installing Vundle.vim..."
    r = subprocess.call([
        "git",
        "clone",
        "https://github.com/gmarik/Vundle.vim.git",
        os.path.join(vimplugins_dir,"Vundle.vim"),
    ])

link = os.path.join(dotfiles_dir,"vim","bundle")
if not os.path.exists(link) and not os.path.islink(link):
    print "Symlinking vim plugins..."
    os.symlink(vimplugins_dir,link)

print "Creating symlinks..."
files = ["gdbinit",
     "lldbinit",
     "gitconfig",
     "ctags",
     "fortunes",
     "oh-my-zsh",
     "vim",
     "vimrc",
     "zshrc",
     "scripts"]
for f in files:
    link = os.path.join(home_dir,"."+f)
    if not os.path.exists(link) and not os.path.islink(link):
        os.symlink(os.path.join(dotfiles_dir,f),link)
        print "  + %s linked" % f

# Install vim bundles
os.system('vim -c VundleInstall -c quitall')

os.system('git clone https://github.com/zsh-users/zsh-syntax-highlighting.git')
os.system('echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc)
