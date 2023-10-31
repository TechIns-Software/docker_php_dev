#!/bin/sh

WEB_USER="www-data"

usermod -u ${DOCKER_UID} ${WEB_USER}
groupmod -g ${DOCKER_GID} ${WEB_USER}

if [ -z ${XDEBUG_HOST} ]; then
  ip=$(get_xdebug_ip | tr -d '\n')
  XDEBUG_HOST=${ip}
fi

XDEBUG_VERSION=$(php -r "echo substr(phpversion('xdebug'),0,1);")

docker-php-ext-enable xdebug
cat ${XDEBUG_CONF_FILE}

if [ "${XDEBUG_VERSION}" = "3" ]; then
  echo "SETUP XDEBUG 3"

  echo "[xdebug]" >> ${XDEBUG_CONF_FILE} 
  echo "xdebug.mode = debug,develop" >> ${XDEBUG_CONF_FILE}
  echo "xdebug.max_nesting_level = 1000" >> ${XDEBUG_CONF_FILE} 
  echo "xdebug.log = /var/log/xdebug/xdebug.log" >> ${XDEBUG_CONF_FILE} 
  echo "xdebug.discover_client_host=false" >> ${XDEBUG_CONF_FILE}
  echo "xdebug.start_with_request = trigger" >> ${XDEBUG_CONF_FILE}

  echo "xdebug.client_host=${XDEBUG_HOST}" >> ${XDEBUG_CONF_FILE}
  echo "xdebug.client_port=${XDEBUG_PORT}" >> ${XDEBUG_CONF_FILE}

else 
  echo "SETUP XDEBUG 2"

  
  echo "xdebug.remote_enable = 1" >>  ${XDEBUG_CONF_FILE}
  echo "xdebug.max_nesting_level = 1000" >>  ${XDEBUG_CONF_FILE}
  echo "xdebug.remote_mode=req" >>  ${XDEBUG_CONF_FILE}
  echo "xdebug.remote_autostart=true" >> ${XDEBUG_CONF_FILE}
  echo "xdebug.remote_log=/var/log/xdebug/xdebug.log" >> ${XDEBUG_CONF_FILE}

  echo "xdebug.remote_host=${XDEBUG_HOST}" >> ${XDEBUG_CONF_FILE}
  echo "xdebug.remote_port=${XDEBUG_PORT}" >> ${XDEBUG_CONF_FILE}
fi


# Common settings accros all version
if [ XDEBUG_DBGP = TRUE ]; then
    echo "xdebug.remote.handler=dbgp" >>${XDEBUG_CONF_FILE}
fi

if [ ! -z "${XDEBUG_IDE_KEY}" ]; then
    echo "xdebug.idekey=\"${XDEBUG_IDE_KEY}\"" >>${XDEBUG_CONF_FILE}
fi

echo "Fixing execution permissions"
find /var/www/html -iname "*.php" | xargs chmod 777

if [ -d "/var/www/.npm" ]; then
 echo "fix /var/www/.npm"
 chown -R ${WEB_USER}:${WEB_USER} /var/www/.npm
 chmod 777 /var/www/.npm
fi

if [ -d "/var/www/.composer" ]; then
 echo "fix /var/www/.composer"
 chown -R ${WEB_USER}:${WEB_USER} /var/www/.composer
 chmod 777 /var/www/.composer
fi

chmod 644 /usr/local/share/ca-certificates/*


echo "Launch application"
exec "$@"