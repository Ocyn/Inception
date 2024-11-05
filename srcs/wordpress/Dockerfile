# OS
FROM alpine:3.19.3

# Update apk, install mariadb then clear the cache
RUN apk update; apk upgrade; \
apk add --no-cache lighttpd php82 fcgi php82-cgi wget openrc mysql mysql-client php82-mysqli; \
rm -rf /var/cache/apk/*

RUN mkdir /run/openrc/ ; touch /run/openrc/softlevel; openrc

COPY ./src/mylighttpd.conf /etc/lighttpd/lighttpd.conf.d/
COPY ./src/mylmod_fastcgi.conf /etc/lighttpd/mod_fastcgi.conf.d/

RUN rc-service lighttpd start ; rc-update add lighttpd default; rc-service lighttpd restart

RUN mkdir -p /usr/share/webapps/ ; \
cd /usr/share/webapps/ ; \
wget https://wordpress.org/latest.tar.gz ; \
tar -xzvf latest.tar.gz ; \
rm latest.tar.gz ; \
chown -R lighttpd /usr/share/webapps/ ; \
ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress ;

COPY ./src/wp-config.php /usr/share/wordpress/

EXPOSE 3306

# Start Mariadb service
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
