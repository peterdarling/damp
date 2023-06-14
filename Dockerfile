FROM php:8.1-apache
RUN apt-get update
RUN apt-get install -y git libzip-dev zip unzip npm libmagickwand-dev
RUN docker-php-ext-install pdo pdo_mysql zip exif intl
RUN pecl install imagick; \
    docker-php-ext-enable imagick;
RUN a2enmod rewrite
# RUN echo "ServerName localhost:80" >> /etc/apache2/apache2.conf
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer