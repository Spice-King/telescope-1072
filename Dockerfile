FROM php:8.0.6-fpm

RUN docker-php-ext-install -j$(nproc) pcntl 
RUN pecl install swoole && docker-php-ext-enable swoole
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ARG USERID=1000 GROUPID=1000

RUN useradd php -mu $USERID -U && groupmod php -g $GROUPID
USER php
