# tiredofit/matomo

## About

Dockerfile to build a [matomo](https://www.matomo.org/) container image. It is an Open Source Google Analytics Replacement.

It will automatically download the latest Piwik release upon build, and if you have set correct environment variables, will autocreate a database if you wish.


[Changelog](CHANGELOG.md)

## Maintainer

- [Dave Conroy][https://github.com/tiredofit]

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Prerequisites and Assumptions](#prerequisites-and-assumptions)
- [Installation](#installation)
  - [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Persistent Storage](#persistent-storage)
  - [Database](#database)
  - [Environment Variables](#environment-variables)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [References](#references)

## Prerequisites and Assumptions

This image relies on an external MySQL Server, external SMTP Server, external Redis Server and is meant to be run behind a reverse SSL Proxy such as nginx-proxy.


## Installation

Automated builds of the image are available on [Registry](https://hub.docker.com/r/tiredofit/matomo)


```bash
docker pull docker.io/tiredofit/matomo
```

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

## Configuration

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory     | Description                |
| ------------- | -------------------------- |
| `/www/matomo` | Root matomo Directory      |
| `/var/log/unit`   | Nginx Unit logfiles |

### Database

This container requires the usage of an external database. Set one up accordingly.

```sql
CREATE USER 'matomo'@'%.%.%.%' IDENTIFIED BY 'password';
CREATE DATABASE IF NOT EXISTS `matomo` DEFAULT CHARACTER SET `utf8` COLLATE `utf8_unicode_ci`;
GRANT ALL PRIVILEGES ON `matomo`.* TO 'matomo'@'%.%.%.%';
```

### Environment Variables

Below is the complete list of available options that can be used to customize your installation.

| Parameter | Description                                         | Default | `_FILE` |
| --------- | --------------------------------------------------- | ------- | ------- |
| `DB_HOST` | MySQL external container hostname (e.g. matomo1-db) |         | x       |
| `DB_NAME` | MySQL database name i.e. (e.g. matomo)              |         | x       |
| `DB_USER` | MySQL username for database (e.g. matomo)           |         | x       |
| `DB_PASS` | MySQL password for database (e.g. userpassword)     |         | x       |


### Networking

The following ports are exposed.

| Port | Description |
| ---- | ----------- |
| `80` | HTTP        |

## Maintenance
### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is e.g. matomo) bash
```

## References

* https://www.matomo.org

