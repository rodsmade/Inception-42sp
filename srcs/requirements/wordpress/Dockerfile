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

# Create a new user named 'marcus' with a specified UID and GID and give it ownership of wp
RUN groupadd -r aurelius --gid 1000 && useradd -r -m -g aurelius --uid 1000 marcus -p senhazinha && chown marcus:aurelius /usr/local/bin/wp && chown -R marcus:aurelius /var/www/wordpress && chown -R marcus:aurelius /etc/php && chown marcus:aurelius /tmp/wordpress-config.sh && chown -R marcus:aurelius /var/log/

# Set 'marcus' as the default user
# USER marcus

WORKDIR /var/www/wordpress

EXPOSE 9000

CMD ["/tmp/wordpress-config.sh"]
# CMD ["tail", "-f"]