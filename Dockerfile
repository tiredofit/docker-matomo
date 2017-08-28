FROM tiredofit/nginx-php-fpm:7.1-latest
MAINTAINER Dave Conroy <dave at tiredofit dot ca>

   RUN  apk update && \
   
        BUILD_DEPS=" \
        autoconf \
        build-base \
        geoip-dev \
        git \
        libressl \
        php7-dev \
        php7-pear \
        sed \
        tar" && \
   
        apk add ${BUILD_DEPS} \
                geoip \
        && \

### Compile & Install Custom PHP7-GeoIP Module
       cd /tmp && \
       git clone https://github.com/Zakay/geoip && \ 
       cd geoip && \
       phpize7 && \ 
       ./configure --with-php-config=/usr/bin/php-config7 && \
       make && \
       make install && \
       echo 'extension=geoip.so' >> /etc/php7/conf.d/00_geoip.ini && \
       echo 'geoip.custom_directory=/www/piwik/misc' >> /etc/php7/php.ini && \
       echo 'always_populate_raw_post_data=-1' >> /etc/php7.ini && \
       echo 'extension=geoip.so' >> /etc/php7.php.ini && \
       apk del ${BUILD_DEPS} php7-dev php7-pear && \
       rm -rf /var/cache/apk/* /tmp/*

### Files Addition
  ADD install /

