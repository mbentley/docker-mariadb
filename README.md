# mbentley/mariadb

docker image for mariadb based off of alpine:3.12

To pull this image:
`docker pull mbentley/mariadb`

Example usage:

```
docker run -d \
  -p 3306:3306 \
  --name mariadb \
  -v mariadb:/var/lib/mysql \
  mbentley/mariadb
```

Optional environment variables:

* `MYSQL_ROOT_PASSWORD` - (optional; defaults to `docker`) `root` user password to set
* `MYSQL_DATABASE` - (optional) creates a database with the given name
* `MYSQL_USER` - (optional) creates a user with access to the value of `MYSQL_DATABASE`
* `MYSQL_PASSWORD` - (optional) sets the password for the user `MYSQL_USER`
* `MYSQLD_ARGS` - (optional) arguments passed to `mysqld`
