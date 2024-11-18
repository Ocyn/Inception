# OS
FROM alpine:3.19.3

# Update apk, install mariadb then clear the cache

RUN apk update && apk upgrade && \
	apk add --no-cache mariadb mariadb-client openrc 

RUN openrc && \
touch /run/openrc/softlevel

RUN /etc/init.d/mariadb setup && \
	rc-service mariadb start && \
	mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'yuri';" \
	-e "CREATE DATABASE IF NOT EXISTS wordpress_db;" \
	-e "CREATE USER IF NOT EXISTS wordpress_usr IDENTIFIED BY 'yuri';" \
	-e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_usr';" \
	-e "FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mariadbd", "--user=mysql" ,"--skip-networking=0"] 