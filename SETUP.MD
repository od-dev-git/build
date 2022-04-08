# Setup on an Ubuntu 18.04 instance on AWS EC2

## Installation 
### Install Postgresql

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04

### Install Java 8

https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04#installing-specific-versions-of-openjdk

### Install Kafka

https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-18-04#step-4-%E2%80%94-creating-systemd-unit-files-and-starting-the-kafka-server

### Install Docker (optional)

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

### Install Docker-Compose (optional)

https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04

### Install nginx

https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04

#### Add a default server

```
server {
	listen 80;
	server_name egov.transerve.com;

    location / {
        proxy_pass http://localhost:8083;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        proxy_set_header        X-Real-IP       $remote_addr;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### Install certbot

https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04


## Use PostgreSQL

PostgreSQL is bound only to local IP Address. So, a connection can be made locally. We only ever use one database `devdb` 

##### Connect via command line.

```sh
sudo -u postgres psql
```
This opens up a `postgres=#` prompt

##### Connect via ssh

Connect via ssh tunnel using the digit config pem file and host and then connect to postgres. The password should not be required but if it did it is the same password used in `jdbc`, i.e. `postgres`.

#### Useful commands

1. List databases: `\l`
2. Drop database: `DROP DATABASE billingnew;`
3. Create a new database: `CREATE DATABASE devdb;`
4. Show users: `\du`