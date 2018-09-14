FROM php:7.2-fpm

LABEL maintainer="Yousung Ahn <help@lovizu.com>"

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        wget \
        libldb-dev \
        python \
        vim \
        unzip \
        mysql-client \
        zip \
        libpq-dev \
        libgd2-dev \
        libjpeg-dev \
        libgif-dev \
        build-essential \
        gcc \
        git \
        apt-utils \
        dos2unix \
        libmcrypt4 \
        libpcre3-dev \
        make \
        python2.7-dev \
        python-pip \
        re2c \
        supervisor \
        unattended-upgrades \
        whois \
        ssh \
        libnotify-bin \
        && docker-php-ext-install -j$(nproc) pdo_mysql mysqli pgsql pdo_pgsql opcache zip \
        && docker-php-ext-install -j$(nproc) sockets pcntl \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  \
        && docker-php-ext-install -j$(nproc) gd \
        # Install Redis and xDebug
        && pecl install redis \
        && pecl install xdebug \
        && docker-php-ext-enable redis xdebug

RUN cd /usr/local/etc/php \
        && wget https://raw.githubusercontent.com/laradock/laradock/master/php-fpm/php7.2.ini \
        && mv php7.2.ini php.ini

## Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer self-update
RUN composer global require hirak/prestissimo
RUN composer global require laravel/envoy
COPY ./config/.bashrc /root/.bashrc

WORKDIR /var/www
RUN ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""

# SSH 설정
ARG ID_RSA=config/id_rsa
ARG ID_RSA_PUB=config/id_rsa.pub

COPY ${ID_RSA} /root/key
COPY ${ID_RSA_PUB} /root/key.pub

RUN cat /root/key > /root/.ssh/id_rsa && rm -rf /root/key \
    && cat /root/key.pub > /root/.ssh/id_rsa.pub && rm -rf /root/key.pub

EXPOSE 9000
