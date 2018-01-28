FROM ubuntu:17.10

#Upgrade & Install
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install curl wget zip 

# apache & php & stuff
RUN apt-get install -y \
      apache2 \
      php \
      php-cli \
      libapache2-mod-php \
      php-apcu \
      php-apcu-bc \
      apt-transport-https \
      php-gd \
      php-json \
      php-ldap \
      php-mbstring \
      php-mysql \
      php-opcache \
      php-pgsql \
      php-sqlite3 \
      php-xml \
      php-xsl \
      php-zip \
      php-soap \
      php-xdebug \
      git \
      vim \
      composer

RUN rm /var/www/html/index.html

#Move core project and config
ADD apache/000-default.conf /etc/apache2/sites-enabled/000-default.conf
ADD app/ /var/www/html/

RUN service apache2 start
CMD service apache2 start;  /bin/bash
