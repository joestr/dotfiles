#!/bin/bash
apt install bash-completion
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.bashrc -O ~/.bashrc
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.nanorc -O ~/.nanorc
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.bash_login -O ~/.bash_login
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.bash_aliases -O ~/.bash_aliases
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.bash_logout -O ~/.bash_logout
exit
