FROM tiredofit/nginx-php-fpm:8.0
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
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE

RUN set -x && \
    apk update && \
    apk add -t .piwik-build-deps \
        autoconf \
        build-base \
        geoip-dev \
        git \
        openssl \
        php8-dev \
        php8-pear \
        sed \
        tar \
        && \
    \
    apk add -t .piwik-run-deps \
        geoip \
        && \
    \
### Compile & Install Custom PHP8-GeoIP Module
#    git clone https://github.com/Zakay/geoip /usr/src/geoip && \
#    cd /usr/src/geoip && \
#    phpize8 && \
#    ./configure --with-php-config=/usr/bin/php-config8 && \
#    make && \
#    make install && \
#    echo "extension=gnupg.so" > /etc/php${PHP_BASE:0:1}/conf.d/20-geoip.ini && \    
#    echo 'geoip.custom_directory=/www/html/misc' >> /etc/php8/php.ini && \
#    echo 'always_populate_raw_post_data=-1' >> /etc/php8/php.ini && \
    \
### Cleanup
    apk del .piwik-build-deps && \
    rm -rf /var/cache/apk/* /usr/src/*

### Add Files
ADD install /
