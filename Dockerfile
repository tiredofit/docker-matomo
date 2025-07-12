ARG PHP_VERSION=8.3
ARG DISTRO="alpine"

FROM docker.io/tiredofit/nginx-php-fpm:${PHP_VERSION}-${DISTRO}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV CRON_PERIOD=60 \
    NGINX_WEBROOT=/www/html \
    PHP_ENABLE_DOM=TRUE \
    PHP_ENABLE_ICONV=TRUE \
    PHP_ENABLE_IGBINARY=TRUE \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_PDO=TRUE \
    PHP_ENABLE_PDO_MYSQL=TRUE \
    PHP_ENABLE_MYSQLND=TRUE \
    PHP_ENABLE_REDIS=TRUE \
    PHP_ENABLE_SIMPLEXML=TRUE \
    PHP_ENABLE_XML=TRUE \
    PHP_ENABLE_XMLREADER=TRUE \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    NGINX_SITE_ENABLED=matomo \
    IMAGE_NAME="tiredofit/matomo" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-matomo"

RUN source /assets/functions/00-container && \
    set -x && \
    package update && \
    package upgrade && \
    php-ext prepare && \
    php-ext reset && \
    php-ext enable core && \
    package cleanup

COPY install /
