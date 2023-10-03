FROM debian:oldstable

# System configuration
RUN apt update && apt upgrade -y && apt install vim curl nginx openssl -y

# NGINX configuration
RUN mkdir -p /data/www
COPY conf/nginx.conf /etc/nginx

# SSL configuration
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=roaraujo.42.fr/UID=roaraujo"

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
