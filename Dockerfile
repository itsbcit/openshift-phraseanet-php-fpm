FROM bcit/openshift-php-fpm:7.3.14

RUN apk add --no-cache \
    exiftool
