#!/bin/sh

# Execute como root

# ------------------------------------------------------------------------------------------------
# Variáveis 
# ------------------------------------------------------------------------------------------------
nomedousuario="nome do seu usuário" # Coloque seu nome de usuário
email="email" # Para configurar o Mercurial (Opcional)
distribuicao="squeeze"


# --------------------------------------------------------------------------------
# Debian Multimedia
# --------------------------------------------------------------------------------
echo >> /etc/apt/sources.list
echo "deb http://www.deb-multimedia.org stable main non-free" >> /etc/apt/sources.list

# Faz o download da keyring
aptitude update
aptitude --assume-yes install deb-multimedia-keyring
aptitude update


# --------------------------------------------------------------------------------
# Debian Backports
# --------------------------------------------------------------------------------
echo >> /etc/apt/sources.list
echo "deb http://backports.debian.org/debian-backports $distribuicao-backports main" >> /etc/apt/sources.list
aptitude update


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
# Comandos de root - sudo sem senha
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

# Copia aliases do bash
cp -v systemFiles/.bash_aliases /root
cp -v systemFiles/.bash_aliases /home/$nomedousuario/

# Mercurial
echo        >> ~/.hgrc
echo "[ui]" >> ~/.hgrc
echo "username = $nomedousuario <$email>" >> ~/.hgrc


# --------------------------------------------------------------------------------
# Vi Improved
# --------------------------------------------------------------------------------
cp -v systemFiles/.vimrc /root
cp -v systemFiles/.vimrc /home/$nomedousuario/


# --------------------------------------------------------------------------------
# Scripts
# --------------------------------------------------------------------------------
cp --verbose bin/* /bin


# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# Instalação de Pacotes
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------


# --------------------------------------------------------------------------------
# Atualização Inicial
# --------------------------------------------------------------------------------
aptitude update
aptitude --assume-yes upgrade


# --------------------------------------------------------------------------------
#  Multimedia
# --------------------------------------------------------------------------------
aptitude --assume-yes install vlc
aptitude --assume-yes install nrg2iso
aptitude --assume-yes install bchunk          #bin2iso
aptitude --assume-yes install audacity
aptitude --assume-yes install avidemux 
# Record My Desktop
aptitude --assume-yes install recordmydesktop
aptitude --assume-yes install gtk-recordmydesktop
# Converte Vídeos do YouTube para MP3
aptitude --assume-yes install ffmpeg youtube-dl
# Toca músicas pela linha de comando.
aptitude --assume-yes install mpg321
# Edição de imagem pela linha de comando
aptitude --assume-yes install imagemagick


# --------------------------------------------------------------------------------
# Wine
# --------------------------------------------------------------------------------
aptitude --assume-yes install wine


# --------------------------------------------------------------------------------
# Virtual Box
# --------------------------------------------------------------------------------
aptitude --assume-yes install virtualbox-ose


# --------------------------------------------------------------------------------
# Navegadores
# --------------------------------------------------------------------------------
# Google Chrome
aptitude --assume-yes install libcurl3
wget "https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_i386.deb"
dpkg --install "google-chrome-stable_current_i386.deb"
rm "google-chrome-stable_current_i386.deb"

# Firefox
wget --quiet "http://mozilla.c3sl.ufpr.br/releases//firefox/releases/9.0.1/linux-i686/pt-BR/firefox-9.0.1.tar.bz2"
tar xjvf "firefox-9.0.1.tar.bz2"
rm "firefox-9.0.1.tar.bz2"
mv firefox /home/$nomedousuario


# --------------------------------------------------------------------------------
# Adobe Flash
# --------------------------------------------------------------------------------
aptitude --assume-yes install flashplugin-nonfree
/usr/sbin/update-alternatives --config flash-mozilla.so


# --------------------------------------------------------------------------------
# Java SUN
# --------------------------------------------------------------------------------
#aptitude --assume-yes install sun-java6-jdk
#aptitude --assume-yes install sun-java6-jre
#aptitude --assume-yes install sun-java6-plugin
#update-java-alternatives -s java-6-sun


# --------------------------------------------------------------------------------
# Compactadores e Descompactadores
# --------------------------------------------------------------------------------
aptitude --assume-yes install bzip2
aptitude --assume-yes install zip 
aptitude --assume-yes install rar
aptitude --assume-yes install p7zip-full


# --------------------------------------------------------------------------------
# SSH
# --------------------------------------------------------------------------------
aptitude --assume-yes install openssh-server


# --------------------------------------------------------------------------------
# Aparência
# --------------------------------------------------------------------------------
aptitude --assume-yes install colorgcc
aptitude --assume-yes install colordiff
aptitude --assume-yes install colormake
aptitude --assume-yes install colortail
# Fontes
aptitude --assume-yes install xfonts-terminus
aptitude --assume-yes install xfonts-terminus-oblique
aptitude --assume-yes install xfonts-mona
aptitude --assume-yes install ttf-georgewilliams
aptitude --assume-yes install ttf-nafees
aptitude --assume-yes install ttf-freefont
aptitude --assume-yes install ttf-bitstream-vera


# --------------------------------------------------------------------------------
# Funcionalidades
# --------------------------------------------------------------------------------
aptitude --assume-yes install bash-completion


# --------------------------------------------------------------------------------
# System Tools
# --------------------------------------------------------------------------------
aptitude --assume-yes install htop
aptitude --assume-yes install iftop
aptitude --assume-yes install galternatives
aptitude --assume-yes install macchanger


# --------------------------------------------------------------------------------
# Atualização de Horário e Data 
# --------------------------------------------------------------------------------
#aptitude --assume-yes install ntpdate
#ntpdate br.pool.ntp.org br.pool.ntp.org br.pool.ntp.org #Atualização da hora


# --------------------------------------------------------------------------------
# Development
# --------------------------------------------------------------------------------
aptitude --assume-yes install gcc
aptitude --assume-yes install g++
aptitude --assume-yes install make
aptitude --assume-yes install python3
aptitude --assume-yes install binutils
aptitude --assume-yes install libstdc++5

# Mercurial and tools
aptitude --assume-yes install mercurial
aptitude --assume-yes install hgview

# --------------------------------------------------------------------------------
# Linux Development
# --------------------------------------------------------------------------------
aptitude --assume-yes install build-essential # Package Development


# --------------------------------------------------------------------------------
# Linux Kernel
# --------------------------------------------------------------------------------
aptitude --assume-yes install linux-headers-$(uname -r)


# --------------------------------------------------------------------------------
# Editores
# --------------------------------------------------------------------------------
aptitude --assume-yes install vim 


# --------------------------------------------------------------------------------
# Diversos
# --------------------------------------------------------------------------------
aptitude --assume-yes install webhttrack
aptitude --assume-yes install hdparm 


# --------------------------------------------------------------------------------
# Renomear Arquivos em Lote
# --------------------------------------------------------------------------------
wget --quiet "http://ufpr.dl.sourceforge.net/project/file-folder-ren/Metamorphose/1.1.2%20stable/metamorphose_1.1.2-2_all.deb"
dpkg --install "metamorphose_1.1.2-2_all.deb"
rm "metamorphose_1.1.2-2_all.deb"

aptitude --assume-yes install gprename


# --------------------------------------------------------------------------------
# Dropbox
# --------------------------------------------------------------------------------
# Prerequisitos
aptitude --assume-yes install libnautilus-extension-dev
aptitude --assume-yes install python-docutils
# Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -
~/.dropbox-dist/dropboxd



# --------------------------------------------------------------------------------
# 
# --------------------------------------------------------------------------------







