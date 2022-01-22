# ---------------------------------------------
#                 Apache Setup
# ---------------------------------------------

# Apache Install
apt-get install apache2 -y

# Ajout du compte vagrant à www-data
adduser vagrant www-data

# ---------------------------------------------
#                PHP/MySql Setup
# ---------------------------------------------

# Utilisé en ligne de commande uniquement
export DEBIAN_FRONTEND="noninteractive"

# Setting MySQL root user password root/root
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Installation des packets php/mysql
sudo apt-get install -y php libapache2-mod-php mysql-server php-mysql php-intl

# Modification des valeurs date.timezone
sed -i '/^date.timezone/d' /etc/php/7.4/apache2/php.ini
echo "date.timezone = Indian/Antananarivo" >> /etc/php/7.4/apache2/php.ini

sed -i '/^date.timezone/d' /etc/php/7.4/cli/php.ini
echo "date.timezone = Indian/Antananarivo" >> /etc/php/7.4/cli/php.ini

# ---------------------------------------------
#               PHPMyAdmin setup
# ---------------------------------------------

# Default PHPMyAdmin Settings
debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'

# Install PHPMyAdmin
apt-get install -y phpmyadmin

# Inclure le fichier conf de PhpMyAdmin
echo "include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

# Restarting apache to make changes
service apache2 restart

# ---------------------------------------------
#                Composer Setup
# ---------------------------------------------

# Installation des sources
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer


# ---------------------------------------------
#        Configure VHOST Apache (Optionnal)
# ---------------------------------------------

# Ajout du ServerName (FQDN) dans le fichier de config Apache
echo "ServerName test.local" >> /etc/apache2/apache2.conf

# Création du fichier Host
VHOST=$(cat <<EOF
<VirtualHost *:80>
    ServerName test.local
    ServerAdmin admin@test.local
    ServerAlias localhost
    DocumentRoot /var/www/html/demo/public

    <Directory /var/www/demo/public>
        AllowOverride None
        Order Allow,Deny
        Allow from All

        <IfModule mod_rewrite.c>
            Options -MultiViews
            RewriteEngine On
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteRule ^(.*)$ index.php [QSA,L]
        </IfModule>
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error_monsite.log
    CustomLog ${APACHE_LOG_DIR}/access_monsite.log combined
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/test.conf

# Reconfigure Apache
a2enmod rewrite
a2ensite test.conf
a2dissite 000-default.conf
service apache2 restart

