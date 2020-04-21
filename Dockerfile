FROM bcit/centos:7
ENV TZ America/Vancouver
ENV HOME /application

LABEL centos_version="7"
LABEL php_version="7.0"
LABEL build_id="1587502820"

RUN yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
        epel-release \
        http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
 && yum-config-manager --enable remi-php70 \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
    file \
    perl-Image-ExifTool \
    php-fpm \
    php-cli \
    php-xml \
    php-gd \
    php-odbc \
    php-intl \
    php-bcmath \
    php-ldap \
    php-soap \
    php-common \
    php-xmlrpc \
    php-dba \
    php-enchant \
    php-dbg \
    php-json \
    php-mbstring \
    php-process \
    php-pdo \
    php-recode \
    php-mysqlnd \
    php-gmp \
    php-opcache \
    unoconv \
    xpdf

RUN yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
    http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
        ffmpeg \
        gpac


COPY 50-copy-config.sh           /docker-entrypoint.d/
COPY 55-php.ini-date.timezone.sh /docker-entrypoint.d/
