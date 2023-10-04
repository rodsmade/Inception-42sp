#!/bin/bash

wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbhost=$SQL_HOST --dbpass=$SQL_PASSWORD --allow-root
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWD --allow-root
echo "listen = '0.0.0.0:9000'" >> /etc/php81/php-fpm.d/www.conf
php-fpm81 -F