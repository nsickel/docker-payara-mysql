### Objective
This repository contains an extended dockerfile of [payara/server-full](https://github.com/payara/docker-payaraserver-full)
, which is able to create a jdbc connection to a mysql database on start up by providing environment variables.
### Environment variables
```
  MYSQL_DATABASE        name of database 
  MYSQL_HOST            host where databse is located
  MYSQL_PORT            port of database
  MYSQL_USER            user to login to database
  MYSQL_PASSWORD        password to login user
  MYSQL_ROOT_PASSWORD   password to login as root user
```
An example of a valid environment file is provided in repository file example.env