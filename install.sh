#!/usr/bin/env bash

echo "
    ##------------------------------------------------------//
    ##       Script d'installation de la VM Ubuntu          //
    ##                  Technical Test By ..                //
    ##------------------------------------------------------//
"

# Check if user is sudoer
if [ $(whoami) != "root" ]; then
	echo "\nAlert: l'utilisation du script doit ce faire en sudo...\n"
	exit
fi

# Nettoyage des dépendences
apt-get -y update
rm -rf /var/lib/apt/lists/*
apt-get -y update

# MAJ et Installation des paquets basique
apt-get -y upgrade
apt-get -y install htop zip iotop iptraf

# Paramètrage du nom d'hôte: hostname
echo "test.local" > /etc/hostname
hostname test.local

# ---------------------------------------
#    Apache, PHP, Mysql, PhpMyAdmin... 
#      Set your command line Here
# ---------------------------------------

# ---------------------------------------
#     Install Web project from Github
#       Set your command line Here
# ---------------------------------------


echo "###################################################"
echo "######## Congrats, Ubuntu VM is install !  ########"
echo "###################################################"
echo ""
echo "Login:pass for local VM: vagrant:vagrant"
echo ""
echo "By ..."

exit
