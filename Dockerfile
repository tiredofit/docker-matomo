FROM tiredofit/nginx-php-fpm:7.3
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

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
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE

RUN set -x && \
    apk update && \
    apk add -t .piwik-build-deps \
        autoconf \
        build-base \
        geoip-dev \
        git \
        libressl \
        php7-dev \
        php7-pear \
        sed \
        tar \
        && \
    \
    apk add -t .piwik-run-deps \
        geoip \
        && \
    \
### Compile & Install Custom PHP7-GeoIP Module
    git clone https://github.com/Zakay/geoip /usr/src/geoip && \
    cd /usr/src/geoip && \
    phpize7 && \
    ./configure --with-php-config=/usr/bin/php-config7 && \
    make && \
    make install && \
    #echo 'extension=geoip.so' >> /etc/php7/conf.d/00_geoip.ini && \
    #echo 'geoip.custom_directory=/www/piwik/misc' >> /etc/php7/php.ini && \
    echo 'always_populate_raw_post_data=-1' >> /etc/php7/php.ini && \
    \
### Cleanup
    apk del .piwik-build-deps && \
    rm -rf /var/cache/apk/* /usr/src/*

### Add Files
ADD install /
