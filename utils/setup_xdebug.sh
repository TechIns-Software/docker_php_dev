#!/usr/bin/env bash

XDEBUG_VERSION="$(echo -e "${XDEBUG_VERSION}" | tr -d '[:space:]')"

if [ "${XDEBUG_VERSION}" != "" ]; then
    echo "Installing xdebug version ${XDEBUG_VERSION}"
    install-php-extensions xdebug-${XDEBUG_VERSION}
else
    echo "Installing xdebug latest verion"
    install-php-extensions install xdebug
fi

mkdir -p /var/log/xdebug
touch /var/log/xdebug/xdebug.log
chown -R www-data:www-data /var/log/xdebug
chmod 666 -R /var/log/xdebug