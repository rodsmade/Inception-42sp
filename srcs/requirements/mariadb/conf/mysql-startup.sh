#!/bin/ash

# Add your startup commands here
echo "Configuring mariadb server upon container start..."

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# TESTE APAGAR !!!!!!!!!!!!!!!!!!! N ESQUECER !!!!!!!!!!!!!!!!!
# TESTE APAGAR !!!!!!!!!!!!!!!!!!! N ESQUECER !!!!!!!!!!!!!!!!!
# TESTE APAGAR !!!!!!!!!!!!!!!!!!! N ESQUECER !!!!!!!!!!!!!!!!!
# TESTE APAGAR !!!!!!!!!!!!!!!!!!! N ESQUECER !!!!!!!!!!!!!!!!!
tail -f &

mariadbd-safe &
sleep 8
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" && mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" && mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" && mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" && mariadb -u root --password=$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
