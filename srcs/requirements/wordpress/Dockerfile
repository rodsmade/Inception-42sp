FROM debian:oldstable

# Copy files
COPY ./conf/wordpress-config.sh /tmp/wordpress-config.sh
RUN chmod +x /tmp/wordpress-config.sh

# Install base commands
RUN apt update && apt upgrade -y && apt install wget curl iputils-ping sendmail sudo less vim php-fpm php-mysql mariadb-client -y

# Get Wordpress
RUN wget https://fr.wordpress.org/wordpress-6.3-fr_FR.tar.gz -P /var/www && tar -xzf /var/www/wordpress-6.3-fr_FR.tar.gz -C /var/www/ && rm /var/www/wordpress-6.3-fr_FR.tar.gz
RUN mkdir -p /var/run/php && chmod 755 /var/run/php

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

EXPOSE 9000

CMD ["/tmp/wordpress-config.sh"]
# CMD ["tail", "-f"]