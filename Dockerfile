FROM            --platform=linux/amd64 mautic/mautic:5.1.1-apache

USER            root

RUN             apt-get update && \
                apt-get install --no-install-recommends -y git-all nodejs npm

ENV             COMPOSER_ALLOW_SUPERUSER=1

ENV             COMPOSE_INTERACTIVE_NO_CLI=1
# Install Composer
RUN             curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN             cd /var/www/html

RUN             npm install

WORKDIR         /var/www/html

COPY            docker /var/www/html/docker/

RUN             composer require pabloveintimilla/mautic-amazon-ses

RUN             php bin/console cache:clear

RUN             chown -R www-data:www-data /var/www/html/

RUN             chmod -R 777 /var/www/html/ 

WORKDIR         /var/www/html