# hub.docker.com/tiredofit/piwik

# Introduction

Dockerfile to build a [piwik](https://www.piwik.org/) container image. It is an Open Source Google Analytics Replacement.

It will automatically download the latest Piwik release upon build, and if you have set correct environment variables, will autocreate a database if you wish.

This Container uses Alpine:Edge as a base.
Additional Components are PHP7 w/ APC, OpCache, LDAP Support - MySQL Client is also available.


[Changelog](CHANGELOG.md)

# Authors

- [Dave Conroy](https://github.com/tiredofit)

# Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Database](#database)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
    - [Networking](#networking)
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

# Prerequisites

This image relies on an external MySQL Server, external SMTP Server, external Redis Server and is meant to be run behind a reverse SSL Proxy such as nginx-proxy.


# Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/tiredofit/piwik) and is the recommended method of installation.


```bash
docker pull hub.docker.com/tiredofit/piwik
```

# Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

# Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
|-----------|-------------|
| `/www/piwik` | Root piwik Directory |
| `/www/logs` | Nginx and php-fpm logfiles |

### Database

This container requires the usage of an external database. Set one up accordingly.

```sql
CREATE USER 'piwik'@'%.%.%.%' IDENTIFIED BY 'password';
CREATE DATABASE IF NOT EXISTS `piwik` DEFAULT CHARACTER SET `utf8` COLLATE `utf8_unicode_ci`;
GRANT ALL PRIVILEGES ON `piwik`.* TO 'piwik'@'%.%.%.%';
```

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine), and the [Nginx+PHP-FPM Engine](https://hub.docker.com/r/tiredofit/nginx-php-fpm) below is the complete list of available options that can be used to customize your installation.


| Parameter | Description |
|-----------|-------------|
| `DB_HOST` | MySQL external container hostname (e.g. piwik1-db)
| `DB_NAME` | MySQL database name i.e. (e.g. piwik)
| `DB_USER` | MySQL username for database (e.g. piwik)
| `DB_PASS` | MySQL password for database (e.g. userpassword)


### Networking

The following ports are exposed.

| Port      | Description |
|-----------|-------------|
| `80` | HTTP |

# Maintenance
#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. piwik) bash
```

# References

* https://www.piwik.org

