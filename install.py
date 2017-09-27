#!/usr/bin/python3
import os
import platform
import subprocess

def main():
  print("Installing dotfiles")
  print("-------------------\n")

  home_dir       = os.getenv("HOME")
  dotfiles_dir   = os.path.dirname(os.path.abspath(__file__))
  vimplugins_dir = os.path.join(home_dir, ".vimplugins")
  system = platform.system()

  if system == "Darwin":
    # Install homebrew and libraries
    print("Installing homebrew")
    os.system("/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")

    print("Installing brew packages")
    os.system("brew update")
    os.system("brew install ack")
    os.system("brew install cmake")
    os.system("brew install ctags")
    os.system("brew install npm")
    os.system("brew install tmux")
    os.system("brew install tree")
    os.system("brew install vim")
    os.system("brew install python")
  else:
    raise ValueError("Linux install needs to be updated")

  print("Installing pure prompt")
  os.system("npm install --global pure-prompt")

  print("Installing Python")
  os.system("pip3 install virtualenv")
  os.system("pip3 install virtualenvwrapper")

  print("Aliasing vi -> vim")
  os.system("sudo rm /usr/bin/vi")
  os.system("sudo ln -s /usr/bin/vim /usr/bin/vi")

  print("Installing zsh syntax highlighting")
  os.system('git clone https://github.com/zsh-users/zsh-syntax-highlighting.git')
  os.system("echo \"source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh\" >> ${ZDOTDIR:-$HOME}/.zshrc")

  if not os.path.exists(vimplugins_dir):
      print("Installing Vundle.vim...")
      r = subprocess.call([
          "git",
          "clone",
          "https://github.com/gmarik/Vundle.vim.git",
          os.path.join(vimplugins_dir,"Vundle.vim"),
      ])

  link = os.path.join(dotfiles_dir,"vim","bundle")
  if not os.path.exists(link) and not os.path.islink(link):
      print("Symlinking vim plugins...")
      os.symlink(vimplugins_dir,link)


  print("Creating symlinks...")
  files = ["gdbinit",
       "lldbinit",
       "gitconfig",
       "ctags",
       "fortunes",
       "ackrc",
       "vim",
       "vimrc",
       "zshrc",
       "startup.py",
       "tmux.conf",
       "scripts"]
  for f in files:
      link = os.path.join(home_dir,"."+f)
      if not os.path.exists(link) and not os.path.islink(link):
          os.symlink(os.path.join(dotfiles_dir,f),link)
          print("  + %s linked" % f)

  # Install vim bundles
  os.system('vim -c VundleInstall -c quitall')

  print("Compiling vim plugins")
  os.chdir(home_dir+"/.vim/bundle/YouCompleteMe")
  os.system("/usr/bin/env python install.py --clang-completer")

if __name__ == "__main__":
  main()

