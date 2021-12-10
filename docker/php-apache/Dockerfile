FROM php:7.1-apache

ARG XDEBUG

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && sed -i -e "s/^ *post_max_size.*/post_max_size = 64MB/g" /usr/local/etc/php/php.ini \
    && sed -i -e "s/^ *upload_max_filesize.*/upload_max_filesize = 64MB/g" /usr/local/etc/php/php.ini

RUN docker-php-ext-install pdo_mysql mysqli opcache

RUN apt-get update \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN if [ "$XDEBUG" = "1" ] ; then pecl install xdebug-2.8.1 && docker-php-ext-enable xdebug; else echo XDEBUG DISABLED; fi

RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod ssl
RUN a2enmod include
RUN a2enmod expires
RUN a2enmod actions
RUN a2enmod status
RUN a2enmod info

RUN service apache2 restart
