# OS
FROM alpine:3.19.3

# Update apk, install mariadb then clear the cache
RUN apk update; apk upgrade; \
apk add mariadb \
mariadb-client \
rm -rf /var/cache/apk/*

# RUN rc-service mariadb start

# Start Mariadb service
CMD ["mariabd"]
