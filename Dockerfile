ARG DEFAULT_UBUNTU_VERSION=20.04

FROM ubuntu:${DEFAULT_UBUNTU_VERSION}
MAINTAINER tech@ascetic.io

ENV PHP_FPM_HOST="php"
ENV PHP_FPM_PORT="9000"


# Install apache, and supplimentary programs. openssh-server, curl, and lynx-cur are for debugging the container.
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 libapache2-mod-fcgid && \
    service apache2 stop && \
    a2dismod mpm_prefork && \
    a2enmod mpm_event alias proxy proxy_fcgi rewrite

# Copy the default virtual host configuration file
COPY ./conf/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2ensite 000-default.conf

EXPOSE 80 443

# Load container
CMD ["apachectl", "-D", "FOREGROUND"]