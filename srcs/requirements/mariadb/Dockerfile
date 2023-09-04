FROM debian:oldstable

RUN apt update && apt upgrade
RUN apt install mariadb-server -y

ENTRYPOINT ["mysqld"]
