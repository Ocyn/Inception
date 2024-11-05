# OS
FROM alpine:3.19.3

# Update apk, install mariadb then clear the cache
RUN apk update; apk upgrade; \
apk add --no-cache mysql mysql-client openrc; \
rm -rf /var/cache/apk/*

RUN mkdir /run/openrc/ ; touch /run/openrc/softlevel; openrc

# Environnment variables for mariadb settings
ENV MYSQL_ROOT_PASSWORD=yuri \
MYSQL_DISABLE_REMOTE_ROOT=true \
MYSQL_REMOVE_ANONYMOUS_USERS=true \
MYSQL_REMOVE_TEST_DATABASE=true


RUN mariadb-install-db --user=root --ldata=/var/lib/mysql; \
mkdir /run/mysqld;

RUN echo "[mysqld]" >> /etc/my.cnf; \
echo "skip-networking=0" >> /etc/my.cnf; \
echo "skip-bind-address" >> /etc/my.cnf;

EXPOSE 3306

# Start Mariadb service
CMD ["mariadbd", "--user=root"]
