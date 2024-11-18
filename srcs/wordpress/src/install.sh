#!/bin/sh

wp core download;

wp config create --dbname=wordpress_db --dbuser=wordpress_usr --dbpass=yuri --dbhost=srcs-mariadb-1 --allow-root;

sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php82/php-fpm.d/www.conf

wp core install --url=jcuzin.42.fr --title=Inception --admin_user=admin --admin_password=yuri --admin_email=jcuzin@student.42lyon.fr --skip-email;


php-fpm82 -F
# lighttpd -D -f /etc/lighttpd/lighttpd.conf