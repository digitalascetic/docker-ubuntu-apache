FROM ubuntu:20.04
MAINTAINER tech@ascetic.io

ENV PHP_FPM_PORT="9000"


# Install apache, and supplimentary programs. openssh-server, curl, and lynx-cur are for debugging the container.
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 libapache2-mod-fcgid curl && \
    service apache2 stop && \
    a2dismod mpm_prefork && \
    a2enmod alias proxy proxy_fcgi

# Copy the default virtual host configuration file
COPY ./conf/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./conf/info.php /var/www/html/info.php

RUN a2ensite 000-default.conf

# Load container
CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80