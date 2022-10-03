# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configuración de Vagrant
Vagrant.configure("2") do |config|
  
  # Indicamos el box que vamos a utilizar en nuestra
  # máquina virtual
  config.vm.box = "ubuntu/xenial64"

  # Configuramos una máquina virtual con Apache
  # Definimos que la app es un servidor web
  config.vm.define "web" do |app|
	# Definimos el nombre del host
    app.vm.hostname = "web"
	# Definimos la red
    app.vm.network "public_network"
	# Definimos el aprovisionamiento como shell
    app.vm.provision "shell", path: "provision-for-apache.sh"
  end

  # Configuramos otra máquina virtual con Adminer
  config.vm.define "db" do |app|
	# Definimos el nombre del host
    app.vm.hostname = "db"
	# Definimos la red
    app.vm.network "public_network"
	# Definimos el aprovisionamiento como shell
    app.vm.provision "shell", path: "provision-for-mysql.sh"
  end

end