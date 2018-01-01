FROM alpine:latest
MAINTAINER Matt Bentley <nbentley@mbentley.net>

RUN (apk --no-cache add mariadb mariadb-client &&\
  deluser mysql &&\
  addgroup -g 507 mysql &&\
  adduser -h /var/lib/mysql -D -u 507 -g mysql -G mysql -s /sbin/nologin mysql &&\
  mkdir /run/mysqld /etc/mysql/conf.d/ &&\
  echo '' >> /etc/mysql/my.cnf &&\
  echo '!includedir /etc/mysql/conf.d/' >> /etc/mysql/my.cnf &&\
  chown -R mysql:mysql /run/mysqld /var/lib/mysql /etc/mysql)

COPY run.sh /run.sh

EXPOSE 3306
VOLUME ["/var/lib/mysql"]
CMD ["/run.sh"]
