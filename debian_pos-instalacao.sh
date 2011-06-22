#!/bin/bash

nomedousuario="bcr"

# --------------------------------------------------------------------------------
# Debian Multimedia
# --------------------------------------------------------------------------------
echo >> /etc/apt/sources.list
echo "deb http://www.debian-multimedia.org squeeze main" >> /etc/apt/sources.list

wget --quiet "http://debian-multimedia.org/pool/main/d/debian-multimedia-keyring/debian-multimedia-keyring_2010.12.26_all.deb"
dpkg --install "debian-multimedia-keyring_2010.12.26_all.deb"
rm "debian-multimedia-keyring_2010.12.26_all.deb"


# --------------------------------------------------------------------------------
# Debian Backports
# --------------------------------------------------------------------------------
echo >> /etc/apt/sources.list
echo "deb http://backports.debian.org/debian-backports squeeze-backports main" >> /etc/apt/sources.list


# --------------------------------------------------------------------------------
# Wine HQ
# --------------------------------------------------------------------------------
echo >> /etc/apt/sources.list
echo "deb http://www.lamaresh.net/apt squeeze main" >> /etc/apt/sources.list

wget -O - http://www.lamaresh.net/apt/key.gpg | apt-key add -


# --------------------------------------------------------------------------------
# Java SUN
# --------------------------------------------------------------------------------
echo 'JAVA_HOME="/usr/lib/jvm/java-6-sun"' | tee -a /etc/environment


# --------------------------------------------------------------------------------
# Aparência
# --------------------------------------------------------------------------------



# --------------------------------------------------------------------------------
# Funcionalidades
# --------------------------------------------------------------------------------
# Comandos de root apenas com sudo sem senha
adduser $nomedousuario sudo
echo >> /etc/sudoers
echo "%sudo ALL=NOPASSWD: ALL" >> /etc/sudoers

echo                                        >> /root/.bashrc
echo "if [ -f /etc/bash_completion ]; then" >> /root/.bashrc
echo "	. /etc/bash_completion"             >> /root/.bashrc
echo "fi"                                   >> /root/.bashrc

echo                                    >> /root/.bashrc
echo "if [ -f ~/.bash_aliases ]; then"  >> /root/.bashrc
echo "    . ~/.bash_aliases"            >> /root/.bashrc
echo "fi"                               >> /root/.bashrc

# Copia alias do bash
cp -v systemFiles/.bash_aliases /root
cp -v systemFiles/.bash_aliases /home/$nomedousuario/


# --------------------------------------------------------------------------------
# Vi Improved
# --------------------------------------------------------------------------------
cp -v systemFiles/.vimrc /root
cp -v systemFiles/.vimrc /home/$nomedousuario/


# --------------------------------------------------------------------------------
# Scripts
# --------------------------------------------------------------------------------
cp -v bin/* /bin


# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# Instalação
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------


# --------------------------------------------------------------------------------
# Atualização Inicial
# --------------------------------------------------------------------------------
aptitude update
aptitude -y full-upgrade


# --------------------------------------------------------------------------------
#  Multimedia
# --------------------------------------------------------------------------------
aptitude -y install vlc
aptitude -y install mplayer
aptitude -y install nrg2iso
aptitude -y install bchunk          #bin2iso
aptitude -y install audacity
aptitude -y install avidemux 
aptitude -y install recordmydesktop


# --------------------------------------------------------------------------------
# Wine HQ
# --------------------------------------------------------------------------------
aptitude -y install wine


# --------------------------------------------------------------------------------
# Virtual Box
# --------------------------------------------------------------------------------
aptitude -y install virtualbox-ose


# --------------------------------------------------------------------------------
# Navegadores
# --------------------------------------------------------------------------------
# Google Chrome
aptitude -y install libcurl3
wget --quiet "https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_i386.deb"
dpkg --install "google-chrome-stable_current_i386.deb"
rm "google-chrome-stable_current_i386.deb"

# Firefox 4
wget --quiet "http://mozilla.c3sl.ufpr.br/releases//firefox/releases/4.0.1/linux-i686/en-US/firefox-4.0.1.tar.bz2"
tar xjvf "firefox-4.0.1.tar.bz2"
rm "firefox-4.0.1.tar.bz2"
mv firefox /home/bcr

# --------------------------------------------------------------------------------
# Adobe Flash
# --------------------------------------------------------------------------------
aptitude -y install flashplugin-nonfree
/usr/sbin/update-alternatives --config flash-mozilla.so

# --------------------------------------------------------------------------------
# Java SUN
# --------------------------------------------------------------------------------
aptitude -y install sun-java6-jdk
aptitude -y install sun-java6-jre
aptitude -y install sun-java6-plugin
update-java-alternatives -s java-6-sun

# --------------------------------------------------------------------------------
# Compactadores e Descompactadores
# --------------------------------------------------------------------------------
aptitude -y install bzip2
aptitude -y install zip 
aptitude -y install rar
aptitude -y install p7zip-full

# --------------------------------------------------------------------------------
# SSH
# --------------------------------------------------------------------------------
aptitude -y install openssh-server

# --------------------------------------------------------------------------------
# Aparência
# --------------------------------------------------------------------------------
aptitude -y install colorgcc
aptitude -y install colordiff
aptitude -y install colormake
aptitude -y install colortail
# Fontes
aptitude -y install xfonts-terminus
aptitude -y install xfonts-terminus-oblique
aptitude -y install xfonts-mona
aptitude -y install ttf-georgewilliams
aptitude -y install ttf-nafees
aptitude -y install ttf-freefont
aptitude -y install ttf-bitstream-vera


# --------------------------------------------------------------------------------
# Funcionalidades
# --------------------------------------------------------------------------------
aptitude -y install bash-completion


# --------------------------------------------------------------------------------
# System Tools
# --------------------------------------------------------------------------------
aptitude -y install htop
aptitude -y install iftop
aptitude -y install galternatives


# --------------------------------------------------------------------------------
# Atualização de Horário e Data 
# --------------------------------------------------------------------------------
aptitude -y install ntpdate
ntpdate br.pool.ntp.org br.pool.ntp.org br.pool.ntp.org #Atualização da hora


# --------------------------------------------------------------------------------
# Development
# --------------------------------------------------------------------------------
aptitude -y install gcc
aptitude -y install g++
aptitude -y install make
aptitude -y install python3
aptitude -y install binutils
aptitude -y install libstdc++5
aptitude -y install mercurial


# --------------------------------------------------------------------------------
# Linux Development
# --------------------------------------------------------------------------------
aptitude -y install build-essential # Package Development


# --------------------------------------------------------------------------------
# Linux Kernel
# --------------------------------------------------------------------------------
aptitude -y install linux-headers-$(uname -r)


# --------------------------------------------------------------------------------
# Editores
# --------------------------------------------------------------------------------
aptitude -y install vim 


# --------------------------------------------------------------------------------
# Diversos
# --------------------------------------------------------------------------------
aptitude -y install webhttrack
aptitude -y install hdparm 


# --------------------------------------------------------------------------------
# Renomear Arquivos em Lote
# --------------------------------------------------------------------------------
wget --quiet "http://ufpr.dl.sourceforge.net/project/file-folder-ren/Metamorphose/1.1.2%20stable/metamorphose_1.1.2-2_all.deb"
dpkg --install "metamorphose_1.1.2-2_all.deb"
rm "metamorphose_1.1.2-2_all.deb"

aptitude -y install gprename


# --------------------------------------------------------------------------------
# Dropbox
# --------------------------------------------------------------------------------
aptitude -y install libnautilus-extension-dev
aptitude -y install python-docutils
wget --quiet "http://www.dropbox.com/download?dl=packages/nautilus-dropbox-0.6.7.tar.bz2"
tar xjvf "nautilus-dropbox-0.6.7.tar.bz2"
cd nautilus-dropbox-0.6.7
./configure
make
make install
dropbox start -i
rm -r "nautilus-dropbox-0.6.7.tar.bz2" nautilus-dropbox-0.6.7







