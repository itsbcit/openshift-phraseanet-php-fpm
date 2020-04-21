FROM bcit/centos:7

RUN yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
        epel-release \
        http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
 && yum-config-manager \
        --enable remi-php74 \
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
