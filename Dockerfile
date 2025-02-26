FROM debian:bookworm
RUN apt update && apt install php-fpm curl -y
RUN mkdir -p /run/php && \
	sed -i "s/\/run\/php\/php8.2-fpm.sock/0.0.0.0:9000/" \
	/etc/php/8.2/fpm/pool.d/www.conf
WORKDIR /temp/wordpress
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp && \
	wp core download --allow-root
ENTRYPOINT [ "php-fpm8.2", "-F" ]