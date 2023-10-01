#!/bin/bash

wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbhost=mariadb-inception-ctnr --dbpass=$SQL_PASSWORD --allow-root
wp core install --url=batatafrita.com --title=batatasfritas --admin_user=guillermo --admin_email=gui@curacau.com --allow-root
wp user create 0xEDU eduardo@tachotte.com.br --allow-root
# echo "[unique_pool_name_of_mine]" >> /etc/php/7.4/fpm/pool.d/qqcoisa.conf
echo "listen = '0.0.0.0:9000'" >> /etc/php/7.4/fpm/pool.d/www.conf


php-fpm7.4 -F