#!/bin/bash

# Actualizamos el sistema operativo e instalamos apache
apt-get update
apt-get install -y apache2

# Instalamos la librería libapache2-mod-php y mysql
apt-get install -y php libapache2-mod-php php-mysql

# Reiniciamos apache e instalamos el gestor de base de datos Adminer
sudo /etc/init.d/apache2 restart
cd /var/www/html
wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-mysql.php
mv adminer-4.3.1-mysql.php adminer.php