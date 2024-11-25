# OS
FROM alpine:3.19.3

# Update apk, install mariadb then clear the cache

RUN apk update && apk upgrade && \
	apk add --no-cache mariadb mariadb-client openrc 

ARG DB_ROOT_PASSWORD
ARG DB_USER
ARG DB_PASSWORD
ARG DB_NAME

RUN openrc && \
touch /run/openrc/softlevel

RUN /etc/init.d/mariadb setup && \
	rc-service mariadb start && \
	mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" \
	-e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" \
	-e "CREATE USER IF NOT EXISTS '${DB_USER}' IDENTIFIED BY '${DB_PASSWORD}';" \
	-e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}';" \
	-e "FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mariadbd", "--user=mysql" ,"--skip-networking=0"] 