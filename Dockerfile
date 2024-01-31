FROM php:7.4.30-fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    && apt-get install -y \
    git \
    unzip \
    && apt-get install -f
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY . /var/www/html
WORKDIR /var/www/html
COPY .env.example /var/www/html/.env

RUN composer install
CMD php artisan serve --host=0.0.0.0 --port=8012
EXPOSE 8012