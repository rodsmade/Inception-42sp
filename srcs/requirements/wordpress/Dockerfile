FROM debian:oldstable

# Install base commands
RUN apt update && apt upgrade -y && apt install wget curl sudo less vim php-fpm php-mysql -y

# Get Wordpress
RUN mkdir pastinha && wget https://fr.wordpress.org/wordpress-6.3-fr_FR.tar.gz -P /pastinha && tar -xzf /pastinha/wordpress-6.3-fr_FR.tar.gz -C /pastinha/ && rm /pastinha/wordpress-6.3-fr_FR.tar.gz

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Create a new user named 'marcus' with a specified UID and GID and give it ownership of wp
RUN groupadd -r aurelius --gid 1000 && useradd -r -m -g aurelius --uid 1000 marcus && chown marcus:aurelius /usr/local/bin/wp

# Set 'marcus' as the default user
# USER marcus

WORKDIR /pastinha/wordpress

EXPOSE 4242

CMD ["php", "-S", "localhost:4242"]