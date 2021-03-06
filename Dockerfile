FROM alpine:3.12
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN (apk --no-cache add mariadb mariadb-client mariadb-server-utils &&\
  deluser mysql &&\
  addgroup -g 507 mysql &&\
  adduser -h /var/lib/mysql -D -u 507 -g mysql -G mysql -s /sbin/nologin mysql &&\
  mkdir /run/mysqld &&\
  chown -R mysql:mysql /run/mysqld /var/lib/mysql /etc/mysql)

COPY run.sh /run.sh

EXPOSE 3306
VOLUME ["/var/lib/mysql"]
CMD ["/run.sh"]
