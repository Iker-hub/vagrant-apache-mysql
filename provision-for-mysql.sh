#!/bin/bash

# Actualizamos el sistema operativo e instalamos debconf-utils
apt-get update
apt-get -y install debconf-utils

# Definimos la contraseña de la base de datos
DB_ROOT_PASSWD=root
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"

# Instalamos mysql-server y reiniciamos mysql
apt-get install -y mysql-server
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
/etc/init.d/mysql restart

# Otorgamos todos los privilegios al usuario root
mysql -uroot mysql -p$DB_ROOT_PASSWD <<< "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '$DB_ROOT_PASSWD'; FLUSH PRIVILEGES;"