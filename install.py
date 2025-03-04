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
    ]

    if system == "Darwin":
        # Install homebrew and libraries
        print("Installing homebrew")
        # os.system("/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")

        packages += [
            "pyenv",
            "pyenv-virtualenv",
        ]


        print("Installing brew packages")
        # os.system("brew update")
        #for p in packages:
        #    os.system("brew install {}".format(p))
    else:
        # print("Installing apt packages")
        os.system("sudo apt-get update")
        os.system("sudo apt-get install {}".format(" ".join(packages)))

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
        #if not os.path.exists(link) and not os.path.islink(link):
        #os.remove(link)
        os.symlink(os.path.join(dotfiles_dir, f), link)
        print("  + %s linked" % f)

    print("Installing pure prompt")
    os.system("mkdir -p \"$HOME/.zsh\"")
    os.system("git clone https://github.com/sindresorhus/pure.git \"$HOME/.zsh/pure\"")

    print("Installing zsh syntax highlighting")
    os.system('git clone https://github.com/zsh-users/zsh-syntax-highlighting.git')
    os.system("echo \"source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh\" >> ${ZDOTDIR:-$HOME}/.zshrc")

    # print("Installing fuzzyfinder")
    # os.system("git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf")
    # os.system("~/.fzf/install")


if __name__ == "__main__":
    main()
