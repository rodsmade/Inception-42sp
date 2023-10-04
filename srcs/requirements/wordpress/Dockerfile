FROM alpine:3.17

RUN apk update && apk add --no-cache mysql-client php-fpm php81 \
    php81-phar php81-common php81-session php81-iconv php81-json \
    php81-gd php81-curl php81-xml php81-mysqli php81-imap php81-cgi \
    fcgi php81-pdo php81-pdo_mysql php81-soap php81-posix php81-tokenizer \
    php81-gettext php81-ldap php81-ctype php81-dom php81-simplexml curl

ARG SQL_DATABASE
ARG SQL_USER 
ARG SQL_PASSWORD 
ARG SQL_ROOT_PASSWORD
ARG SQL_HOST
ARG WP_ADMIN_USER
ARG WP_ADMIN_PASSWD
ARG WP_ADMIN_EMAIL
ARG WP_USER
ARG WP_USER_PASSWD
ARG WP_USER_EMAIL
ARG WP_URL
ARG WP_TITLE

COPY ./conf/wordpress-startup.sh /tmp/wordpress-startup.sh

RUN chmod +x /tmp/wordpress-startup.sh

WORKDIR /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && wp core download --allow-root

EXPOSE 9000

ENTRYPOINT ["ash", "-f", "/tmp/wordpress-startup.sh"]