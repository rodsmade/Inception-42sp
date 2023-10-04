FROM alpine:3.17

RUN apk update && apk add mariadb mariadb-client openrc --no-cache

ARG SQL_DATABASE
ARG SQL_USER 
ARG SQL_PASSWORD 
ARG SQL_ROOT_PASSWORD

COPY ./conf/inception.cnf /etc/mysql/inception.cnf
COPY ./conf/mysql-startup.sh /tmp/mysql-startup.sh

RUN chmod +x /tmp/mysql-startup.sh && ash -f /tmp/mysql-startup.sh

EXPOSE 3306

CMD ["mariadbd-safe"]

