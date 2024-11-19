# OS
FROM alpine:3.19.3

# Update apk, install mariadb then clear the cache
RUN apk update; apk upgrade; \
apk add --no-cache lighttpd php82 php82-fpm php82-cgi curl php82-mysqli php82-phar php82-mbstring php82-json php82-openssl \
mariadb-client; \
rm -rf /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp && \
wp cli update

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY src/install.sh /bin/

RUN chmod +x /bin/install.sh

ENTRYPOINT [ "install.sh" ]