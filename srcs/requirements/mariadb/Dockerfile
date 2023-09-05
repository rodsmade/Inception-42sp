FROM debian:oldstable

RUN apt update && apt upgrade
RUN apt install mariadb-server -y
RUN rm -fr /run/mysqld/mysqld.sock && mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

CMD ["mysqld"]
