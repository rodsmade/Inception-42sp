FROM debian:oldstable

# System configuration
RUN apt update && apt upgrade -y
RUN apt install vim -y
RUN apt install curl -y

# NGINX configuration
RUN apt install nginx -y
RUN mkdir -p /data/www
RUN mkdir -p /var/www/roaraujo
COPY data /data
COPY conf/nginx.conf /etc/nginx
COPY conf/roaraujo.42.fr /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/roaraujo.42.fr /etc/nginx/sites-enabled/

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# RUN apt-get install openssl
# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=roaraujo.42.fr/UID=roaraujo"
