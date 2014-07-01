#!/usr/bin/ruby

# Create symlinks
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
puts "Symlinking %d files:" % files.count
files.each do |f|
  if File.symlink?("../."+f)
    puts "  + "+f+" already linked, skipping."
  elsif File.exists?("../."+f)
    puts "  - "+f+" already exists, skipping."
  elsif File.directory?("../."+f)
    puts "  - "+f+" already exists, skipping."
  else
    File.symlink(".dotfiles/"+f,"../."+f)
    puts "  + "+f+" link created"
  end
end

system("git submodule add https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim")
system("git submodule add https://github.com/mgharbi/oh-my-zsh.git oh-my-zsh")
