#!/usr/bin/python3
import os
import platform


def main():
    print("Installing dotfiles")
    print("-------------------\n")

    home_dir = os.getenv("HOME")
    dotfiles_dir = os.path.dirname(os.path.abspath(__file__))
    system = platform.system()

    packages = [
        "cmake",
        "ctags",
        "libncurses-dev",
        "git",
        "npm",
        "tmux",
        "tree",
        "vim",
        "wget",
        "the_silver_searcher",
        "silversearcher-ag",
        "zsh",
        "curl",
        "openssh-server",
    ]

    if system == "Darwin":
        # Install homebrew and libraries
        print("Installing homebrew")
        os.system("/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")

        print("Installing brew packages")
        os.system("brew update")
        for p in packages:
            os.system("brew install {}".format(p))

        print("Installing Anaconda")
        os.system("wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-MacOSX-x86_64.sh --output $HOME/anaconda.sh")
        os.system("bash ~/anaconda.sh -b -p $HOME/anaconda")
        os.system('export PATH="$HOME/anaconda/bin:$PATH"')
    else:
        # print("Installing apt packages")
        os.system("sudo apt-get update")
        os.system("sudo apt-get install {}".format(" ".join(packages)))

        print("Installing Anaconda")
        os.system("curl https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh -O $HOME/anaconda.sh")
        os.system("bash ~/anaconda.sh -b -p $HOME/anaconda")
        os.system('export PATH="$HOME/anaconda/bin:$PATH"')
        print("Starting ssh service")
        os.system("sudo service ssh start")

        print("Installing vim")
        os.system("sh install_vim.sh")

        print("Switching shell to ZSH")
        os.system("chsh -s $(which zsh)")

        print("Creating symlinks...")
        files = ["gdbinit",
                 "lldbinit",
                 "gitconfig",
                 "ctags",
                 "clang-format",
                 "fortunes",
                 "vim",
                 "vimrc",
                 "zshrc",
                 "startup.py",
                 "tmux.conf",
                 "scripts"]
        for f in files:
            link = os.path.join(home_dir, "." + f)
            if not os.path.exists(link) and not os.path.islink(link):
                os.symlink(os.path.join(dotfiles_dir, f), link)
                print("  + %s linked" % f)

                print("Installing Torch")
                os.system("conda install pytorch-nightly cuda92 -c pytorch")

                print("Installing pure prompt")
                # os.system("sudo npm install --global pure-prompt")
                os.system("mkdir -p \"$HOME/.zsh\"")
                os.system("git clone https://github.com/sindresorhus/pure.git \"$HOME/.zsh/pure\"")
)
                print("Installing zsh syntax highlighting")
                os.system('git clone https://github.com/zsh-users/zsh-syntax-highlighting.git')
                os.system("echo \"source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh\" >> ${ZDOTDIR:-$HOME}/.zshrc")

                print("Installing fuzzyfinder")
                os.system("git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf")
                os.system("~/.fzf/install")


if __name__ == "__main__":
    main()
