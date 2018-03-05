FROM tiredofit/nginx-php-fpm:7.1
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

   ENV CRON_PERIOD=60 \
       PHP_ENABLE_ICONV=TRUE

   RUN apk update && \
       apk add -t build-deps \
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
   
       apk add -t run-deps \
           geoip \
           && \

### Compile & Install Custom PHP7-GeoIP Module
       git clone https://github.com/Zakay/geoip /usr/src/geoip && \
       cd /usr/src/geoip && \
       phpize7 && \
       ./configure --with-php-config=/usr/bin/php-config7 && \
       make && \
       make install && \
       echo 'extension=geoip.so' >> /etc/php7/conf.d/00_geoip.ini && \
       echo 'geoip.custom_directory=/www/piwik/misc' >> /etc/php7/php.ini && \
       echo 'always_populate_raw_post_data=-1' >> /etc/php7/php.ini && \

### Cleanup
       apk del build-deps && \
       rm -rf /var/cache/apk/* /usr/src/*

### Add Files
   ADD install /
