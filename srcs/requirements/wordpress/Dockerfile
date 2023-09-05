FROM debian:oldstable

RUN apt update && apt upgrade -y
RUN apt install php-fpm php-mysql -y

ENTRYPOINT ["/bin/bash"]