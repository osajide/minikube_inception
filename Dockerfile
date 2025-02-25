FROM debian:bookworm
RUN apt update && apt install php-fpm -y
RUN mkdir -p /run/php && \
	sed -i "s/\/run\/php\/php8.2-fpm.sock/0.0.0.0:9000/" \
	/etc/php/8.2/fpm/pool.d/www.conf
ENTRYPOINT [ "php-fpm8.2", "-F" ]