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
COPY environment/apache/zoomed.conf /etc/apache2/sites-available/zoomed.conf
RUN a2ensite zoomed

RUN install -o www-data -g www-data -d /var/www/public_html/ /var/www/public_html/upload/
COPY Bootstrap-image-upload-form/index.html /var/www/public_html/
COPY Bootstrap-image-upload-form/upload-image.js /var/www/public_html/
COPY Bootstrap-image-upload-form/upload-image.php /var/www/public_html/