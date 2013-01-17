#!/bin/sh

# Acesse o site http://www.ruby-lang.org/pt/downloads/ para ver a última versão do Ruby
VERSAORUBY="1.9.3"
# Coloque o nome de usuario que usa
USUARIO="nomedeusuario"
# 1 para Debug. No modo Debug nada é executado. Apenas os comandos que serão executados aparecem na tela.
DEBUG=1

echo "-------------------------------------------------"
echo "RVM"
echo "-------------------------------------------------"
echo

echo "Atualização do Sistema Operacional"
if [ $DEBUG -ne 1 ]; then
  aptitude update
  aptitude upgrade
else
  echo "aptitude update"
  echo "aptitude upgrade"
fi
echo


echo "Instalação do Git, curl e build-essential"
if [ $DEBUG -ne 1 ]; then
  aptitude install curl
else
  echo "aptitude install curl"
fi
echo

echo "Instalação do RVM"
if [ $DEBUG -ne 1 ]; then
  curl -L https://get.rvm.io | bash -s stable
else
  echo "curl -L https://get.rvm.io | bash -s stable"
fi
echo

echo "Adiciona rvm para o PATH"
if [ $DEBUG -ne 1 ]; then
  echo >> ~/.bashrc
  echo ". /usr/local/rvm/scripts/rvm" >> ~/.bashrc
  echo >> /home/$USUARIO/.bashrc
  echo ". /usr/local/rvm/scripts/rvm" >> /home/$USUARIO/.bashrc
else
  echo "echo >> ~/.bashrc"
  echo "echo \". /usr/local/rvm/scripts/rvm\" >> ~/.bashrc"
  echo "echo >> /home/$USUARIO/.bashrc"
  echo "echo \". /usr/local/rvm/scripts/rvm\" >> /home/$USUARIO/.bashrc"
fi
echo

echo "Recarrega o bashrc de forma a colocar no PATH o RVM"
if [ $DEBUG -ne 1 ]; then
  . ~/.bashrc
else
  echo ". ~/.bashrc"
fi
echo


echo "Adiciona dependencias"
if [ $DEBUG -ne 1 ]; then
  aptitude install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config
else
  echo "aptitude install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config"
fi
echo

echo "Instala o Ruby. Configura a versão para uso. E define como padrão."
if [ $DEBUG -ne 1 ]; then
  rvm install $VERSAORUBY
  rvm use $VERSAORUBY
  rvm --default use $VERSAORUBY
else
  echo "rvm install $VERSAORUBY"
  echo "rvm use $VERSAORUBY"
  echo "rvm --default use $VERSAORUBY"
fi
echo


echo "Instala última versão do Rails"
if [ $DEBUG -ne 1 ]; then
  gem install rails
else
  echo "gem install rails"
fi
echo

echo "MySQL para o Rails"
if [ $DEBUG -ne 1 ]; then
  gem install mysql2
  aptitude install libmysqlclient-dev
else
  echo "gem install mysql2"
  echo "aptitude install libmysqlclient-dev"
fi
echo





