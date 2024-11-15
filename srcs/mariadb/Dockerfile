# OS
FROM debian:11-slim

# Update apk, install mariadb then clear the cache

RUN apt update -y && apt upgrade -y && \
	apt install -y mariadb-server && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

RUN service mariadb start && \
	mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'yuri';" \
	-e "CREATE DATABASE IF NOT EXISTS wordpress_db;" \
	-e "CREATE USER IF NOT EXISTS wordpress_usr IDENTIFIED BY 'yuri';" \
	-e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_usr';" \
	-e "FLUSH PRIVILEGES;"


EXPOSE 3306

CMD ["mariadbd", "--bind-address=0.0.0.0"]