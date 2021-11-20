FROM php:7.4-apache

# RUN apt update; \
#   apt install php-common/stable php7.4-common/stable-security php7.4-mysql/stable-security -y; \
#   apt install unzip -y
# RUN phpenmod mysqli; docker-php-ext-install mysqli
RUN a2enmod rewrite

# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# COPY composer.* .
# RUN composer install

RUN rm /etc/apache2/sites-enabled/*
COPY environment/apache/image-upload.conf /etc/apache2/sites-available/image-upload.conf
RUN echo 'SetEnv BASE_PATH ${BASE_PATH}' > /etc/apache2/conf-enabled/environment.conf
RUN a2ensite image-upload

COPY public_html /var/www/public_html
RUN install -o www-data -g www-data -d /var/www/upload/
COPY js /var/www/js
COPY app /var/www/app

WORKDIR /var/www/

ENV BASE_PATH="/"