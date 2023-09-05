FROM debian:oldstable

RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN mkdir -p /data/www

COPY data /data
COPY conf/nginx.conf /etc/nginx

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# RUN apt-get install openssl
# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
