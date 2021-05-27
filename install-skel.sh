#!/bin/bash
apt install bash-completion
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.bashrc -O /etc/skel/.bashrc
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.nanorc -O /etc/skel/.nanorc
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.bash_login -O /etc/skel/.bash_login
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.bash_aliases -O /etc/skel/.bash_aliases
wget https://raw.githubusercontent.com/joestr/dotfiles/master/.bash_logout -O /etc/skel/.bash_logout
exit
