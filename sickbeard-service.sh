#!/bin/sh

if [ ! -f "${APP_CONFIG}/config.ini" ]; then
  cat <<EOF > "${APP_CONFIG}/config.ini"
[General]
log_dir = ${APP_DATA}/logs
tv_download_dir = ${APP_DATA}/unsorted
web_root = "${SICKBEARD_WEBROOT}"
EOF
  chown sickbeard:sickbeard "${APP_CONFIG}/config.ini"
  mkdir -p "${APP_DATA}/unsorted" "${APP_DATA}/sorted"
  chown -R sickbeard:sickbeard "${APP_DATA}"
fi

exec /sbin/setuser sickbeard \
  /usr/bin/python2.7 "${APP_HOME}/SickBeard.py" \
  -q \
  --nolaunch \
  --datadir="${APP_CONFIG}"
