# OS
FROM alpine:3.19.3

# Update apk, install mariadb then clear the cache
RUN apk update; apk upgrade; \
apk add mysql mysql-client openrc \
rm -rf /var/cache/apk/*

# RUN rc-service mariadb start
ENV MYSQL_ROOT_PASSWORD=yuri \
MYSQL_DISABLE_REMOTE_ROOT=true \
MYSQL_REMOVE_ANONYMOUS_USERS=true \
MYSQL_REMOVE_TEST_DATABASE=true


RUN rc-service mariadb setup; \
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Start Mariadb service
CMD ["mariadb"]
