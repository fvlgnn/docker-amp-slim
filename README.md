# docker-amp-slim
Docker environement stack with APACHE, MYSQL, PHP (php-apache)


## Overview

Requirement **docker-compose** 


### Stack Setup

* Apache version: 2.4
* PHP version: 7.1
* MySQL version: 5.6


### Docker Images

* php:7.1-apache
* mysql:5.6


### Tree

```
docker-amp-slim
│   .env
│   .gitignore
│   docker-compose.yml
│   LICENSE
│   Makefile
│   README.md
│   
├───app
│       index.php
│       info.php
│       
├───db        
├───docker
│   ├───mysql
│   │       Dockerfile
│   │       
│   └───php-apache
│           app.conf
│           Dockerfile
│           
└───logs
    ├───app
    └───db
```


### Environment Variables

#### Environment file: `.env`

_Edit or view this file before building the stack_

**Variable description**

* `PROJECT_NAME`: Name of your docker stack
* `VERSION_ID`: ID of your project stack. (Use it only if you want try more version of your project)
* `XDEBUG`: Using `1` if you want install xdegub module, otherwise using `0`.
* `TIME_ZONE`: Time zone, using form PHP and MySQL. 
* `APP_URL`: Url of your web app. Using for CMS/Frameweork like Wordpress, CodeIgniter, etc.
* `APACHE_PORT_EXPOSED`: Exposed port of you're web app.
* `MYSQL_PORT_EXPOSED`: Used only if you want connetc to database with external client. It's port number used for connetcting with external client like _HeidiSQL_ or _MySQL Workbench_ to create database and tables. Configure external client connetction using _host_ `127.0.0.1`, _username_ `root` whereas _password_ your `MYSQL_ROOTPASS` and _port_ your `MYSQL_PORT_EXPOSED` as in environment file.
* `MYSQL_ROOTPASS`: MySQL root password. It's not safe use this method in production but for development it's acceptable.
* `MYSQL_USER`: User name for connetion database from your webapp.
* `MYSQL_USER`: User password for connetion database from your webapp.
* `MYSQL_DB`: Database of your webapp. Will be created at the build. Otherwise you can create database from docker exec or external client.


### Workspace

#### Webapp foleder: `app`

This is you WebApp folder. Put here your PHP project (CMS/Framework/Sources).

For connetcting to databse with Framework or source code use `getenv()` variables (view `index.php` source).

```php
$dbhost = getenv('MYSQL_HOST');
$dbuser = getenv('MYSQL_USER');
$dbpass = getenv('MYSQL_PASS');
```

For install a CMS with wizard setup use:

* _hostname_: `mysql` 
* _database_: _the environment variable `MYSQL_DB` as in environment file_ 
* _username_: _the environment variable `MYSQL_USER` as in environment file_ 
* _password_: _the environment variable `MYSQL_PASS` as in environment file_ 
* _port_: `3306` _it's important to declare it!_

#### Database folder: `db`

If you haven't this folder, will be it create at the first build.

`db` folder contains all your databases, don't modify the files inside it. If you need to move your project enviroment, remember to move this folder with its content.
If you don't want the databases to be inside the project folder use the docker-compose volumes.

#### Logs folder: `logs`

Writing logs to files is disabled by default. To enable it, read the Note.


### Note

---

The stack has also been tested with PHP 7.3 and MySQL 5.7, MariaDB 10.*. You can change these variables directly in the Dockerfile.


---

The first time of build after finish if you not connect to database aptendm some minute because the container must be inizilize all system.


---

If you want to use persistent and encrypted databases storage, you can use the `docker volumes` by editing the `docker-compose.yml` as below.

```yaml

# ...
services:
# ...
  mysql:
# ...
    volumes:
      - mysql:/var/lib/mysql
# ...

# add after networks
volumes:
  mysql:

```

---

PHP and Apache logs can be followed on the terminal _(default whit stdout, stderr)_ by `docker-compose logs -f php-apache` command. 
If instead you want to have them in a file, edit the `docker-compose.yml` by adding this line as below.

```yaml

# ...
services:
# ...
  php-apache:
# ...
    volumes:
      - ./logs/app:/var/log/apache2
      # ...
# ...

```

---

For enable MySQL logs edit `docker/mysql/Dockerfile` uncomment this command

```
RUN sed -i "s/#log-error/log-error/g" /etc/mysql/mysql.conf.d/mysqld.cnf
```

---

When stack is ready visit `http://localhost`

For show PHP info go to `http://localhost/info.php`



## Build and Run

If you're on linux system you can run:

* `make install` - builds and init your stack
* `make start` - start your stack
* `make stop` - stop your stack 
* `make remove` - remove your stack but mantain your databases and logs
* `make purge` -  remove your stack and delete all databases and clear logs files
* `make validate` - validate your docker-compose.yml file if you're do any changes


Command in nutshell for build, start, stop, remove and validate the docker stack.

* `docker-compose up -d --build` - builds and init your stack
* `docker-compose down` - remove your stack but mantain your databases and logs
* `docker-compose start` - start your stack
* `docker-compose stop`  - stop your stack 
* `docker-compose down --volumes` - like _down_ but also removes volumes
* `docker-compose config` validate your stack

