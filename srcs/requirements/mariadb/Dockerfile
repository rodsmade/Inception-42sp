FROM debian:oldstable

RUN apt update && apt upgrade -y && apt install mariadb-server -y
RUN rm -fr /run/mysqld/mysqld.sock && mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Create a directory in the container
WORKDIR /conf

# Copy your Bash script into the container (from the same directory as the Dockerfile)
COPY ./conf/startup.sh /conf/startup.sh

# Make the script executable
RUN chmod +x /conf/startup.sh

# Set the entrypoint to your Bash script
ENTRYPOINT ["/conf/startup.sh"]