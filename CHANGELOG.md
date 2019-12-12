## 3.5.2 2019-12-12 <dave at tiredofit dot ca>

   ### Changed
      - Fix Crontab when not using standard Webroot


## 3.5.1 2019-12-12 <dave at tiredofit dot ca>

   ### Added
      - Add Redis, LDAP PHP Extensions


## 3.5.0 2019-12-04 <dave at tiredofit dot ca>

   ### Added
      - Refactor Image to support new tiredofit/nginx-php-fpm base image


## 3.4 2019-06-29 <dave at tiredofit dot ca>

* PHP 7.3
* Alpine 3.10

## 3.3 2018-11-30 <dave at tiredofit dot ca>

* Switch to PHP 7.2

## 3.2 2018-03-06 <dave at tiredofit dot ca>

* Add LLNG Handler Support

## 3.1 2018-03-06 <dave at tiredofit dot ca>

* Cleanup Code to work better with the nginx-php-fpm base images
* Fix some Downloading errors
* Now tracks latest Piwik version
    
## 3.0 2018-02-01 <dave at tiredofit dot ca>

* Change to Matomo

## 2.3 2017-10-26 <dave at tiredofit dot ca>

* Filesystem reorg and version bump

## 2.2 2017-07-06 <dave at tiredofit dot ca>

* PHP_TIMEOUT addition

## 2.1 2017-07-02 <dave at tiredofit dot ca>

* Sanity Test Rebase for s6

## 2.0 2017-06-23 <dave at tiredofit dot ca>

* Rebase with nginx-php-fpm w/ s6.d


## 1.6 2017-05-11 <dave at tiredofit dot ca>
* Rebase, Update PHP7 to 7.14 to Fix Redis Issue

## 1.5 2017-04-07 <dave at tiredofit dot ca>
* Rebase, Update Piwik to 3.03

## 1.4 2017-02-09 <dave at tiredofit dot ca>
* Changed Base to local alpine:edge
* Adjusted sed

## 1.3 2017-02-08 <dave at tiredofit dot ca>
* Added Zabbix Monitoring


## 1.2 2017-01-24 <dave at tiredofit dot ca>
* Bugfix
* PECL Geoip Compiled
* Version Independent, Downloads latest for new installs.
* Redis Capable


## 1.1 2017-01-05 <dave at tiredofit dot ca>

* Re-base to Alpine:edge
* PHP7 
* Nginx backend instead of FPM
* PECL geoip presently not working

## 1.0 2017-01-02 <dave at tiredofit dot ca>

* Initial Commit
* PHP 5.6-fpm
* Piwik 3.0
